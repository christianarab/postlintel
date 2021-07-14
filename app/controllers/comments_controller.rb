class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Organization.events.find(params[:])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
