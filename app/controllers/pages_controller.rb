class PagesController < ApplicationController
  def show
    @quotes = Quote.all.each_slice(3).to_a
    render template: "pages/#{params[:page]}"
  end

  def about
  end
end
