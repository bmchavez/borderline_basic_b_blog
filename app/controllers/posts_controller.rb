class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] 
  before_action :set_user, only: [:show]

  def index
    @posts = policy_scope(Post).order(publish_date: :desc)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
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
    
    if params[:draft]
      @post = Post.new(post_params)
      set_publish_date
      @post.user = current_user
      @post.write_attribute(:draft, true)
      authorize @post
    else
      @post = Post.new(post_params)
      set_publish_date
      @post.user = current_user
      @post.write_attribute(:draft, false)
      set_publish_date
      authorize @post
    end
    
    # @post = Post.new(post_params)
    # @post.user = current_user
    # authorize @post

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
    if params[:draft]
      @post = Post.find(params[:id])
      @post.user = current_user
      @post.write_attribute(:draft, true)
      authorize @post
    else
      @post = Post.find(params[:id])
      @post.user = current_user
      if @post.draft?
        @post.write_attribute(:draft, false)
        set_publish_date
      end
      authorize @post
    end

    # @post = Post.find(params[:id])
    # authorize @post

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

  def set_publish_date
    @post.write_attribute(:publish_date, Time.now)
  end

end


