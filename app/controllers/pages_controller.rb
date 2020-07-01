class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show] 
  # before_action :set_user, only: [:show]
  # before_action :authenticate_user!
  before_action :admin_authenticate

  def about
    @title = 'About Us'
    @content = 'This is the about page'
    @user = User.first
  end

  def dashboard
    @posts = policy_scope(Post).order(publish_date: :desc)
  end

  def newest_post
    redirect_to post_path(Post.last) and return
  end
end


# SEB USED THE FOLLOWING IN HIS MAILER TUTORIAL

# class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  # def home
  # end
# end