class UsersController < ApplicationRecord
  def show
    @user = User.find(current_user.id)
  end
end