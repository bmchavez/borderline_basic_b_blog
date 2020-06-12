class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show] 
  # before_action :set_user, only: [:show]
  # before_action :authenticate_user!
  before_action :admin_authenticate

  def about
    @title = 'About Us'
    @content = 'This is the about page'
  end

  def dashboard
    @posts = policy_scope(Post).order(created_at: :desc)
  end
end


# SEB USED THE FOLLOWING IN HIS MAILER TUTORIAL

# class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  # def home
  # end
# end