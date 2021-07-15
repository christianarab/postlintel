class FollowsController < ApplicationController
  def create
    # follow = Follow.create(follow_params)
    orgfollow = Organization.find(params[:organization_id])
    followreq = orgfollow.followers.create
    puts followreq.errors.messages
    # if 
    #   puts "Followed!"
    # else
    #   puts "There was a problem."
    #   puts follow_request.errors.messages
    # end
  end
  # def show
  #   @organization = Organization.find(params[:id])
  # end

  # def create
  #   @organization = Organization.create(org_params)
  #   redirect_to @organization
  # end
  private
  def follow_params
    params.permit(:organization_id, :id)
  end
end