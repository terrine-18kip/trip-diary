class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  helper_method :editor_user?

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :memo, user_ids: [])
  end

  def editor_user?
    editor_ids = []
    @trip.users.each do |user|
      editor_ids << user.id
    end
    return editor_ids.include?(current_user.id)
  end

  def move_to_index
    unless editor_user?
      redirect_to action: :index
    end
  end
end
