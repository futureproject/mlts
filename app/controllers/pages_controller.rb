class PagesController < ApplicationController
  def show
    @quotes = Quote.all.each_slice(3).to_a
    @screenings = Screening.where('screening_time > ?', DateTime.now).sort_by &:screening_time
    @screenings_hash = Gmaps4rails.build_markers(@screenings) do |screening, marker|
      marker.lat screening.latitude
      marker.lng screening.longitude
    end
    render template: "pages/#{params[:page]}"
  end

  def about
  end
end
