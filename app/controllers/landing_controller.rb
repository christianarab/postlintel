class LandingController < ApplicationController
  def index
    @users = Users.all
  end
end
