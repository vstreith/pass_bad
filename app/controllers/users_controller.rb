class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @clubs = @user.clubs
  end
end
