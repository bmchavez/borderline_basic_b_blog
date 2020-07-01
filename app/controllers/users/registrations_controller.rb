# # frozen_string_literal: true

# class Users::RegistrationsController < Devise::RegistrationsController
#   # before_action :configure_sign_up_params, only: [:create]
#   # before_action :configure_account_update_params, only: [:update]
#   # after_action :update_mailchimp_user
#   # before_action :authenticate_user!
#   # before_action :set_user, only: [:show, :edit, :update]

#   # GET /resource/sign_up
#   # def new
#   #   super
#   # end

#   # # POST /resource
#   # def create
#   #   super
#   # end

#   # GET /resource/edit
#   # def edit
    
#   #   # @user = current_user
#   #   # authorize @user
#   #   # super 
#   # end

#   # PUT /resource
#   def update
#     # set_user
    
#     # if policy(@user).update?
#       # update_mailchimp_user
#       # authorize @user
#       super
#       #   set_user
#       #   update_mailchimp_user
#       # end
        
#       #   # update_mailchimp_user
      
      
#       # if(@user.update(user_params))
#       #   set_user
        
#     # else
#     #   # redirect_to 'home_path'
#     #   # end
#     # end
#   end

#   # DELETE /resource
#   # def destroy
#   #   super
#   # end

#   # GET /resource/cancel
#   # Forces the session data which is usually expired after sign
#   # in to be expired now. This is useful if the user wants to
#   # cancel oauth signing in/up in the middle of the process,
#   # removing all OAuth session data.
#   # def cancel
#   #   super
#   # end

#   protected

#   # If you have extra params to permit, append them to the sanitizer.
#   # def configure_sign_up_params
#   #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
#   # end

#   # If you have extra params to permit, append them to the sanitizer.
#   # def configure_account_update_params
#   #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
#   # end

#   # The path used after sign up.
#   # def after_sign_up_path_for(resource)
#   #   super(resource)
#   # end

#   # The path used after sign up for inactive accounts.
#   # def after_inactive_sign_up_path_for(resource)
#   #   super(resource)
#   # end

#   def update_mailchimp_user
    
#       # set_user
#       # @user = current_user
#       if @user.subscribed == true
#         @status = "subscribed"
#       else
#         @status = "unsubscribed"
#       end
#       @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
#       @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
#       @gibbon.lists(@audience_id).members(Digest::MD5.hexdigest(@user.email.downcase)).upsert(
#         body: {
#           email_address: @user.email,
#           status: @status,
#           merge_fields: {
#             FNAME: @user.first_name,
#             LNAME: @user.last_name
#           }
#         }
#       )
    
#   end
    
#   def set_user
#     @user ||= ((User.find(session[:user_id]) if session[:user_id]) || User.new)
#   end

#   # def user_params
#   #   params.require(:user).permit(:first_name, :last_name, :email, :avatar, :subscribed)
#   # end

# end
