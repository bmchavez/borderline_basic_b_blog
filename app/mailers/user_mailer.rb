class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: "Welcome to Borderline Basic B****!")
    # This will render a view in `app/views/user_mailer`!
  end

  def self.new_post_request
    @recipients = User.where(:subscribed => true).all
    @recipients.each do |recipient|
      new_post(recipient).deliver
    end
  end

  def new_post(recipient)
    @name = recipient.first_name
    @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(recipient.id)
    mail(to: recipient.email, subject: "Borderline Basic B**** Has a New Post!")
  end
end




