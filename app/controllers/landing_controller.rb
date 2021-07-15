class LandingController < ApplicationController

  def index
    if current_user
      redirect_to organizations_path
    end
  end
end
