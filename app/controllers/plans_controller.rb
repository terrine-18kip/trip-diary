class PlansController < ApplicationController
  def create
    plan = Plan.create(plan_params)
    redirect_to trip_path(plan.trip.id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @trip = Trip.find(@plan.trip.id)
    if editor_user?
      @plan.destroy
      redirect_to trip_path(@plan.trip.id)
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:daily).merge(trip_id: params[:trip_id])
  end
end