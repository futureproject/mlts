class PagesController < ApplicationController
  def show
    @quotes = quotes_hash
    @screenings = all_future_screenings
    @markers = screenings_gmaps_hash
    render template: "pages/#{params[:page]}"
  end

  def about
  end

  private

  def quotes_hash
    Rails.cache.fetch("quotes", expires_in: 12.hours) do
      @quotes = Quote.all.each_slice(3).to_a
    end
  end

  def all_future_screenings
      @screenings = Screening.where('screening_time > ?', DateTime.now).sort_by &:screening_time
  end

  def screenings_gmaps_hash
    Gmaps4rails.build_markers(all_future_screenings) do |screening, marker|
      marker.lat screening.latitude
      marker.lng screening.longitude
      marker.infowindow screening.map_label
    end
  end

end
