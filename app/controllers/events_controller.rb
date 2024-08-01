class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Your event has been created."
      redirect_to @event
    else
      flash.now[:error] = "Your event cannot be created due to errors."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :creator, :description)
  end
end
