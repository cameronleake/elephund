class SessionsController < ApplicationController
  
  def new
  end
  
  # Start a new session for the user
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]   
        cookies.permanent[:auth_token] = @user.auth_token  # Save new auth_token in a permament cookie
      else
        cookies[:auth_token] = @user.auth_token    # Save new auth_token in a temporary cookie
      end
      redirect_to account_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  # Logout functionality
  def destroy
    cookies.delete(:auth_token)   # Remove cookie when user logs out
    redirect_to root_url, notice: "Logged Out!"
  end
  
end
