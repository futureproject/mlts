class PagesController < ApplicationController
  def show
    @cms_page = Comfy::Cms::Site.first.pages.root
    @quotes = Quote.all.each_slice(3).to_a
    render template: "pages/#{params[:page]}"
  end

  def about
  end
end
