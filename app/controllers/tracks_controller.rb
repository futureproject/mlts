class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
    @previous_track = Track.find_by_position(@track.position-1)
    @next_track = Track.find_by_position(@track.position+1)
  end
end
