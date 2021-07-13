class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.create(org_params)
    redirect_to @organization
  end

  private

  def org_params
    params.permit(:title, :description, :location, :user_id, :id)
  end
end