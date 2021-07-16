class FollowsController < ApplicationController
  def create
    @org = Organization.find(params[:organization_id])
    if @org.followed? current_user
      flash[:alert] = "You are already following this organization."
    else
      @org.follows.create(follow_params)
      flash[:notice] = "You are now following this organization."
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def follow_params
    params.permit(:organization_id, :user_id)
  end
end