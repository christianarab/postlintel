class LikesController < ApplicationController
  before_action :find_event
  before_action :find_comment

  def create
    if find_comment
      @comment.likes.create(like_params)
      flash[:notice] = "Comment liked!"
    else find_event
      @event.likes.create(like_params)
      flash[:notice] = "Event liked!"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if find_comment
      like = Like.find_by(likeable_type: "Comment", user_id: params[:user_id], event_id: params[:event_id], likeable_id: params[:comment_id])
      like.destroy if like.present?
      flash[:notice] = "Event unliked!"
    elsif find_event
      like = Like.find_by(user_id: params[:user_id], event_id: params[:event_id])
      like.destroy if like.present?
      flash[:notice] = "Event unliked!"
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def find_event
    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      nil
    end
  end

  def find_comment
    if params[:comment_id]
      @comment = Comment.find(params[:comment_id]) 
    else 
      nil
    end
  end

  def like_params
    params.permit(:user_id, :event_id, :id)
  end
end