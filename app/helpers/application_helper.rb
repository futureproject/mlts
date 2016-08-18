module ApplicationHelper
  include Comfy::CmsHelper
  def fetch_cms_screenings
    cms_screenings = @cms_page.children.find_by_slug('screenings').children
    cms_screenings.each do |screening|
      Screening.create({
        city: cms_block_content('city', screening),
        screening_time: cms_block_content('date_and_time', screening),
        country: cms_block_content('country', screening),
        link: cms_block_content('eventbrite_link', screening),
        venue_name: cms_block_content('venue_name', screening),
        street_address: cms_block_content('address', screening)
      })
    end
  end
end
