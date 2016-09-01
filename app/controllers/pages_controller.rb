class PagesController < ApplicationController
  def show
    @cms_page = Comfy::Cms::Site.first.pages.root
    render template: "pages/#{params[:page]}"
  end

  def about
  end
end
