class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    
    UserMailer.with(user: user).welcome
  end

  # def new_post
  #   user = User.first
    
  #   UserMailer.with(user: user).new_post
  # end
end


  
