class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    set_user
    @user = current_user
    authorize @user
  end

  def edit
    # set_user
    @user = current_user
    authorize @user
  end

  def update
    # set_user
    @user = current_user
    authorize @user

    # if(@comment.update(comment_params))
    #   redirect_to post_path(@post, anchor: "comment-#{@comment.id}")
    # else
    #   render 'comments/_edit'
    # end
  end

  private

  def set_user
    # @user = User.find(params[:id])
    @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end