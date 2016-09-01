include Comfy::CmsHelper
@cms_site = Comfy::Cms::Site.first
@cms_page = @cms_site.pages.root
partners = @cms_page.children.find_by_slug('partners').children
partners.each do |partner|
  partner_params = {
    name: cms_block_content('partner_name', partner),
    description: cms_block_content('partner_description', partner),
    link: cms_block_content('link', partner),
  }
  db_partner = Partner.find_or_initialize_by(name: cms_block_content('name', partner))
  db_partner.update(partner_params)
end

