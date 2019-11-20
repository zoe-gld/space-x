class UsersController < ApplicationController
  def show
    @user = current_user
    @spaces = Space.where(user: current_user)
  end
end
