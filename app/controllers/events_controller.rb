class EventsController < ApplicationController
  def index
    @organization = Organization.find(params[:organization_id])
    @events = @organization.events
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @event = @organization.events.create(events_params)
  end

  # def show
  #   @organization = Organization.find(params[:id])
  # end

  # def create
  #   @organization = Organization.create(org_params)
  #   redirect_to @organization
  # end

  private

  def events_params
    params.permit(:title, :description, :location, :user_id, :start_date_time, :end_date_time, :organization_id)
  end
end