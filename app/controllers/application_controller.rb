class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  # Fetch the current logged in user record using the USER_ID, only if the session varaible exists  
  def current_user  
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  # Make the method CURRENT_USER accessible from the view  
  helper_method :current_user
  
  # User must be logged in to access these functions, (use as before filter on controller actions we want to protect)
  def login_authorize
    redirect_to root_url, alert: "Not authorized to access.  Please log in." if current_user.nil?
  end
  
end
