class Api::UsersController < ApplicationController
  
  def create
    @user = User.new()
    render json @us
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
