class UserMailerPreview < ActionMailer::Preview
  def welcome
    @user = User.first
    # @post = policy_scope(Post).order(publish_date: :desc).last.title
    
    UserMailer.with(user: @user).welcome
  end

  def new_post
    user = User.first
    
    UserMailer.with(user: user).new_post
  end
end


  
