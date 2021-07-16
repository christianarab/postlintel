class FollowsController < ApplicationController
  def create
    # follow = Follow.create(follow_params)
    orgfollow = Organization.find(params[:organization_id])
    followreq = orgfollow.follows.create(follow_params)
    puts followreq
    if followreq.save
      puts "Followed!"
    else
      puts "There was a problem."
      puts followreq.errors.messages
    end
    redirect_to organization_follows_path
  end

  private

  def follow_params
    params.permit(:organization_id, :user_id)
  end
end