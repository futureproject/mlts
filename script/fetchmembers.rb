include Comfy::CmsHelper
@cms_site = Comfy::Cms::Site.first
    @cms_page = @cms_site.pages.root
    team_members = @cms_page.children.find_by_slug('about').children
    team_members.each do |team_member|
      team_member_params = {
        name: cms_block_content('name', team_member),
        business_title: cms_block_content('business_title', team_member),
        bio: cms_block_content('bio', team_member),
      }
      db_team_member = TeamMember.find_or_initialize_by(name: cms_block_content('name', team_member))
      db_team_member.update(team_member_params)
    end

