class UpdateMailChimpUser
#   def update_mailchimp_userr
#     set_user
#     @user = current_user
#     if @user.subscribed == true
#       @status = "subscribed"
#     else
#       @status = "unsubscribed"
#     end
#     @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
#     @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
#     @gibbon.lists(@audience_id).members(Digest::MD5.hexdigest(@user.email.downcase)).update(
#       body: {
#         email_address: @user.email,
#         status: @status,
#         merge_fields: {
#           FNAME: @user.first_name,
#           LNAME: @user.last_name
#         }
#       }
#     )
#   end
  
#   private 

#   def set_user
#     @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
#   end
end
