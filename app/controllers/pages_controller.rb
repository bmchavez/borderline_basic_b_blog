class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show] 
  # before_action :set_user, only: [:show]
  # before_action :authenticate_user!
  before_action :admin_authenticate, only: [:dashbord]
  before_action :skip_authorization, only: [:newest_post]
  skip_before_action :authenticate_user!, only: [:newest_post]

  def about
    @title = 'About Us'
    @content = 'This is the about page'
    @user = User.first
  end

  def dashboard
    @posts = policy_scope(Post).order(publish_date: :desc)
  end

  def newest_post
    # @post = P
    @published_posts = Post.where(:draft => false).all.order(publish_date: :desc)
    redirect_to post_path(@published_posts.first) and return
    # authorize
    
  end
end


# SEB USED THE FOLLOWING IN HIS MAILER TUTORIAL

# class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  # def home
  # end
# end