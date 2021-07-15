class LandingController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      redirect_to organizations_path
    end
  end
end
