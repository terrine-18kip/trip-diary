class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :create_user_valid?, only: :create
  before_action :update_user_valid?, only: :update

  helper_method :editor_user?

  def index
    @trips = Trip.all.order(created_at: 'DESC')
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
    @plan = Plan.new
    @plans = @trip.plans.all
    @spots = @trip.spots.all.order(:row_order)
    @total = Spot.sum_fee(@plans)
  end

  def edit
    @plan = Plan.new
    @plans = @trip.plans.all
    @total = Spot.sum_fee(@plans)
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    if editor_user?
      @trip.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :memo, user_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless editor_user?
  end

  def create_user_valid?
    user_validation = params[:trip][:user_ids]
    user_validation.split(',')
    user_validation.each do |user_id|
      render :new unless User.find_by(id: user_id)
    end
  end

  def update_user_valid?
    user_validation = params[:trip][:user_ids]
    user_validation.split(',')
    user_validation.each do |user_id|
      render :edit unless User.find_by(id: user_id)
    end
  end
end
