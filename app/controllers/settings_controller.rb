class SettingsController < ApplicationController
  before_action :skip_authorization
  skip_before_action :authenticate_user!

  def unsubscribe
    user = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @user = User.find(user)
    # @user = User.second
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Subscription Cancelled' 
      redirect_to home_path
    else
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:subscribed)
    end
end
