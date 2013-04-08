class EventsController < ApplicationController
  before_filter :login_authorize, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @events = @user.events
    if @user.email_verified == false
      flash.now.alert = "Email address not yet verified! #{ActionController::Base.helpers.link_to "Click here to send verification email.", 
                          sendmessage_email_verification_path(@user)}".html_safe
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      @user = current_user
      @event.users << @user   # Create an association entry in the PARTICIPATIONS table)
      redirect_to account_path, notice: 'Event was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end
  
end
