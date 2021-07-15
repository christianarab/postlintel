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

  private

  def signup_params
    params.permit(:user_id)
  end

 
end