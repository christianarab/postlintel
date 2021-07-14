class SignupsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @signup = @event.signups.create(signup_params)
    if @signup
      puts "Sign up successful"
    else
      puts "Sign up did not work"
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

  def signup_params
    params.permit(:user_id)
  end
end