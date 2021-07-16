class LikesController < ApplicationController
  before_action :find_event

  def create
    @event.likes.create(like_params)
    flash[:notice] = "You have liked this event."
    redirect_back(fallback_location: root_path)
  end

  private
  def find_event
    @event = Event.find(params[:event_id])
  end

  def like_params
    params.permit(:user_id, :event_id, :id)
  end
end