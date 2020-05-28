class CommentsController < ApplicationController
  before_action :set_user

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    render 'comments/_edit'
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = @user
    authorize @comment

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if(@comment.update(comment_params))
      redirect_to @post
    else
      render 'comments/_edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end


end


