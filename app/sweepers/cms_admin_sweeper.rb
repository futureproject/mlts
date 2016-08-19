class CmsAdminSweeper < ActionController::Caching::Sweeper
  # observe Cms::Page, Cms::Layout, Cms::Snippet
  observe Comfy::Cms::Page, Comfy::Cms::Layout, Comfy::Cms::Snippet
  include Comfy::CmsHelper
  def fetch_cms_screenings
    @cms_site = Comfy::Cms::Site.first
    @cms_page = @cms_site.pages.root
    cms_screenings = @cms_page.children.find_by_slug('screenings').children
    cms_screenings.each do |screening|
      screening_params = {
        city: cms_block_content('city', screening),
        screening_time: cms_block_content('date_and_time', screening),
        country: cms_block_content('country', screening),
        link: cms_block_content('eventbrite_link', screening),
        venue_name: cms_block_content('venue_name', screening),
        street_address: cms_block_content('address', screening)
      }
      db_screening = Screening.find_or_initialize_by(screening_time: cms_block_content('date_and_time', screening))
      db_screening.update(screening_params)
    end
  end

  def after_create(model)
    do_sweeping(model)
  end

  def after_update(model)
    do_sweeping(model)
  end

  def after_destroy(model)
    do_sweeping(model)
  end

  def do_sweeping(model)
    # return unless modification is made from controller action
    return false if session.blank? || assigns(:site).blank?

    Rails.logger.info("CmsAdminSweeper.do_sweeping in progress...")

    @model = model
    @site = assigns(:site) # CmsAdminController always assigns site

    fetch_cms_screenings

    # # Create OtherEmail emailer to send updates
    # OtherEmails.message_to_admin("#{@site.hostname} cms update: #{model.inspect}").deliver

    # # Create your own CmsHelper to expire caches you want
    # CmsHelper.cms_cache_expire_for_locale()
  end
end
