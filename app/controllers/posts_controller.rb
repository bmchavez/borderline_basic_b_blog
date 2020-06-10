class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] 
  before_action :set_user, only: [:show]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    authorize @post
  end
  
  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy

    redirect_to dashboard_path
  end

  private 
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_user
    @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
  end

end


