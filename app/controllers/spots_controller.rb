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

  def edit
    @spot = Spot.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
    redirect_to root_path unless editor_user?
  end

  def update
    @spot = Spot.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
    if @spot.update(spot_params)
      redirect_to trip_path(@spot.plan.trip.id)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
    if editor_user?
      @spot.destroy
      redirect_to trip_path(@spot.plan.trip.id)
    else
      redirect_to root_path
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :category_id, :start_time, :end_time, :fee, :link, :memo).merge(plan_id: params[:plan_id])
  end

end
