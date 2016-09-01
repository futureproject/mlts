class PagesController < ApplicationController
  def show
    @cms_page = Comfy::Cms::Site.first.pages.root
    render template: 'pages/homepage'
  end
end
