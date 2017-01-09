class PagesController < ApplicationController
  def show
    @quotes = Quote.all.each_slice(3).to_a
    @screenings = Screening.where('screening_time > ?', DateTime.now)
    @markers = Gmaps4rails.build_markers(@screenings) do |screening, marker|
      marker.lat screening.latitude
      marker.lng screening.longitude
      marker.infowindow screening.map_label
    end

    render template: "pages/#{params[:page]}"
  end

  def about
  end

end
