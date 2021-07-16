class ProfilesController < ApplicationController
  PROFILES_PER_PAGE = 4
  
  def index
    @page = params.fetch(:page, 0).to_i
    @profiles = Profile.offset(@page * PROFILES_PER_PAGE).limit(PROFILES_PER_PAGE)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to @profile
  end

  def update
    @profile = profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to @profile
  end

  private

  def profile_params
    params.permit(:tagline, :interests, :user_id)
  end
end
