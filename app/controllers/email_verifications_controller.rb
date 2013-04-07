class EmailVerificationsController < ApplicationController
  
  def edit
    @user = User.find_by_email_verification_token!(params[:id])
    @user.update_attribute(:email_verified, true)
    redirect_to root_path, :notice => "Thank You. Your Email Address Verified."
  end
  
end
