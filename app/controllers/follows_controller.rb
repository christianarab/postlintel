class FollowsController < ApplicationController
  # def create
  #   # follow = Follow.create(follow_params)
  #   orgfollow = Organization.find(params[:organization_id])
  #   followreq = orgfollow.follows.create(follow_params)
  #   puts followreq
  #   if followreq.save
  #     puts "Followed!"
  #   else
  #     puts "There was a problem."
  #     puts followreq.errors.messages
  #   end
  #   redirect_to organization_follows_path
  # end

  def create
    @org = Organization.find(params[:organization_id])
    if @org.followed? current_user
      flash[:alert] = "You are already following this organization."
    else
      @org.follows.create(follow_params)
      flash[:notice] = "You are now following this organization."
    end
  end

  private

  def follow_params
    params.permit(:organization_id, :user_id)
  end
end