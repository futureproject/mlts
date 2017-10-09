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
    @location = params[:location]
    if @location == "ND"
      @previous_track = Track.find_by_position(@track.position-1)
      @next_track = Track.find_by_position(@track.position+1)
    else
      @previous_track = Track.where.not("targeted_location LIKE ?", "%ND%").find_by_position(@track.position-1)
      @next_track = Track.where.not("targeted_location LIKE ?", "%ND%").find_by_position(@track.position+1)
    end
  end
end
