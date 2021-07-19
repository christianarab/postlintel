class EventsController < ApplicationController
  def index
    if params[:organization_id]
      @events = Organization.find(params[:organization_id]).events
    else
      @events = Event.all
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @event = @organization.events.create(events_params)
    EventMailer.with(user: @user).event_email.deliver_now
    redirect_to @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update!(events_params)
    redirect_back(fallback_location: root_path)
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'event deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def events_params
    if params[:event].present?
      params.require(:event).permit(:title, :description, :location, :user_id, :start_date_time, :end_date_time, :organization_id)
    else 
      params.permit(:title, :description, :location, :user_id, :start_date_time, :end_date_time, :organization_id)
    end
  end
end