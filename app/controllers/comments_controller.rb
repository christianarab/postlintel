class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    if @event.save
      redirect_back(fallback_location: root_path)
    else
      render organization_event_comments_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @comment = Comment.find(params[:event_id])
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def comment_params
    params.permit(:event_id, :body, :user_id)
  end
end