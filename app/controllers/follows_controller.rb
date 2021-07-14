class FollowsController < ApplicationController
  def create
    @follow = Follow.create(follow_params)
    if follow_request.save
      puts "Followed!"
    else
      puts "There was a problem."
      puts follow_request.errors.messages
    end
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
    params.require(:follow).permit(:follower_id, :followed_id)
  end
end