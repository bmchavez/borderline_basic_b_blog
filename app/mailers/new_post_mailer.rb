class NewPostMailer < ApplicationMailer
  def new_post
    # # @post.user = params[:post] # Instance variable => available in view
    # mail(to: "ben.m.chavez@gmail.com", subject: "Borderline Basic B**** Has a New Post!")
    # # This will render a view in `app/views/user_mailer`!
  
  
    @users = User.all
  #   emails = @users.collect(&:email).join(", ")
    mail(bcc: ["ben.m.chavez@gmail.com", "rosadj.music@gmail.com", "aminchavez.music@gmail.com"], subject: "13yayayaBorderline Basic B**** Has a New Post!")
  

  # @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  # @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
  # @gibbon.lists(@audience_id).members.retrieve(params: {"fields": "members.email_address"})



  end

end


