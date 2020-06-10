class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] 
  before_action :set_user, only: [:show]

  def about
    @title = 'About Us'
    @content = 'This is the about page'
  end

  def dashboard
    @title = 'dashboard'
    @content = 'This your Dashboard!'
    @posts = policy_scope(Post).order(created_at: :desc)
    # @post = Post.find(params[:id])
  end
  

  private 
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_user
    @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
  end

end
