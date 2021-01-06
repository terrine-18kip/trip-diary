class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :set_plans, only: [:show, :edit]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :user_valid?, only: [:create, :update]

  helper_method :editor_user?

  def index
    @trips = Trip.all.order(created_at: 'DESC')
    @items = WpItem.get
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    respond_to do |format|
      if @trip.save
        format.js { render js: "window.location = '#{edit_trip_path(@trip.id)}'" }
      else
        format.js { render js: "alert('タイトルを入力して下さい');" }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.js { render js: "window.location = '#{edit_trip_path(@trip.id)}'" }
      else
        format.json { render json: @trip.errors, status: :unprocessable_entity }
        format.js { render js: "alert('タイトルを入力して下さい');" }
      end
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

  def set_plans
    @plan = Plan.new
    @plans = @trip.plans.all.order(:daily)
    @spots = @trip.spots.all.order(:position)
    @total = Spot.sum_fee(@plans)
  end

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :memo, :trip_image, user_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless editor_user?
  end

  def user_valid?
    user_validation = params[:trip][:user_ids]
    user_validation.split(',')
    user_validation.each do |user_id|
      render :edit unless User.find_by(id: user_id)
    end
  end
end
