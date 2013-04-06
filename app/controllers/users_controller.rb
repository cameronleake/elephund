class UsersController < ApplicationController
  before_filter :login_authorize, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = User.find(:all)
  end
 
  def show
    @user = current_user
  end
    
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end

  def create
     @user = User.new(params[:user])
     if @user.save
       cookies[:auth_token] = @user.auth_token    # Save new auth_token in a temporary cookie
       @user.send_welcome_email
       redirect_to account_url, notice: "Welcome to Elephund! Please check your email and follow the link to confirm your email address."
     else
       render "new"
      end
   end
   
   def update
     @user = current_user
     if @user.update_attributes(params[:user])
       redirect_to @user, notice: 'Profile was successfully updated.'
     else
       render action: "edit"
     end
   end
   
   def destroy
     @user = current_user
     @user.destroy
    end
end
