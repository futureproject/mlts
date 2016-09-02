class MovingForwardController < ApplicationController
  def show
    page = params[:page] || "index"
    render template: "moving_forward/#{page}"
  end
end
