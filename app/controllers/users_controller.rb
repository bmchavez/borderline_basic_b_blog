class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  
  def index
    @users = User.all
  end

  def show
    set_user
    # @user.email = user.email
    authorize @user
  end

  private

  def set_user
    # @user = User.find(params[:id])
    @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
  end
  
  def user_params
    params.require(:user).permit(:email)
  end
end