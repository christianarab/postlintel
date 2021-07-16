class LikesController < ApplicationController
  before_action :find_event

  def create
    @event = Event.find(params[:event_id])
    @like = @event.likes.new(like_params)
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def find_event
    @event = Event.find(params[:event_id])
  end

  def like_params
  params.permit(:user_id, :event_id, :id)
  end
end