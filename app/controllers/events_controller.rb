class EventsController < ApplicationController
  before_filter :login_authorize, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @events = @user.events    # Only show events which belong to the current user, (associated through the PARTICIPATIONS table)
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
