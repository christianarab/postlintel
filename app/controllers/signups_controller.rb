class SignupsController < ApplicationController
  # Add a constraint: one user_id towards one event_id
  def create
    @event = Event.find(params[:event_id])
    if @event.signed_up? current_user
      flash[:alert] = "You are already signed up."
    else
      @signup = @event.signups.create(signup_params)
      flash[:notice] = "You are now signed up."
    end
  end

  def status
    @event = Event.find(params[:event_id])
    if @event.signups.includes(signup_params)
      puts "This person is signed up already"
    else
      puts "not signed up yet"
    end
  end

  private

  def signup_params
    params.permit(:user_id)
  end

  def status
    @event = Event.find(params[:event_id])
    if @event.signups.includes(signup_params)
      puts "This person is signed up already"
    else
      puts "not signed up yet"
    end
  end
end