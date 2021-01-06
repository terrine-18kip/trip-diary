class SpotsController < ApplicationController
  before_action :set_spot, only: [:edit, :update, :destroy]

  def new
    @spot = Spot.new
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
    redirect_to root_path unless editor_user?
  end

  def create
    @spot = Spot.new(spot_params)
    respond_to do |format|
      if @spot.save
        format.js { render js: "window.location = '#{edit_trip_path(@spot.plan.trip.id)}'" }
      else
        format.js { render js: "alert('スポット名を入力して下さい');" }
      end
    end
  end

  def edit
    redirect_to root_path unless editor_user?
  end

  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.js { render js: "window.location = '#{edit_trip_path(@trip.id)}'" }
      else
        format.js { render js: "alert('スポット名を入力して下さい');" }
      end
    end
  end

  def destroy
    if editor_user?
      @spot.destroy
      redirect_to edit_trip_path(@trip.id)
    else
      redirect_to root_path
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
  end

  def spot_params
    params.require(:spot).permit(:name, :category_id, :start_time, :end_time, :fee, :link, :memo, :position).merge(plan_id: params[:plan_id], trip_id: params[:trip_id])
  end
end
