class SpotsController < ApplicationController
  def new
    @spot = Spot.new
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
    redirect_to root_path unless editor_user?
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to trip_path(@spot.plan.trip.id)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :category_id, :start_time, :end_time, :fee, :link, :memo).merge(plan_id: params[:plan_id])
  end

end
