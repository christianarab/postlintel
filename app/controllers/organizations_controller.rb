class OrganizationsController < ApplicationController
  ORGANIZATIONS_PER_PAGE = 4
  
  def index
    @page = params.fetch(:page, 0).to_i
    @organizations = Organization.offset(@page * ORGANIZATIONS_PER_PAGE).limit(ORGANIZATIONS_PER_PAGE)
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.create!(org_params)
    redirect_to @organization
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update!(org_params)
    redirect_to @organization
  end

  private
  def org_params
    params.require(:organization).permit(:user_id, :organization_id, :title, :description, :location, :org_photo, :id)
  end
end