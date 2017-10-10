class TracksController < ApplicationController
  def index
    @location = params[:location]
    if @location == "ND"
      @tracks = Track.all
    else
      @tracks = Track.where.not("targeted_location LIKE ?", "%ND%")
    end
  end

  def show
    @track = Track.find(params[:id])
    @medium_color = darken_color(@track.color, 0.35)
    @darker_color = darken_color(@track.color, 0.2)
    @location = params[:location]
    if @location == "ND"
      @previous_track = Track.find_by_position(@track.position-1)
      @next_track = Track.find_by_position(@track.position+1)
    else
      @previous_track = Track.where.not("targeted_location LIKE ?", "%ND%").find_by_position(@track.position-1)
      @next_track = Track.where.not("targeted_location LIKE ?", "%ND%").find_by_position(@track.position+1)
    end
  end

  private
  # Amount should be a decimal between 0 and 1. Lower means darker
  def darken_color(hex_color, amount)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = (rgb[0].to_i * amount).round
    rgb[1] = (rgb[1].to_i * amount).round
    rgb[2] = (rgb[2].to_i * amount).round
    "#%02x%02x%02x" % rgb
  end

end
