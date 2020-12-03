class PlansController < ApplicationController
  def create
    plan = Plan.create(plan_params)
    redirect_to trip_path(plan.trip.id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    if editor_user?
      @plan.destroy
      redirect_to trip_path(@plan.trip.id)
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:daily).merge(trip_id: params[:trip_id])
  end

  def editor_user?
    @trip = Trip.find(params[:trip_id])
    editor_ids = []
    @trip.users.each do |user|
      editor_ids << user.id
    end
    editor_ids.include?(current_user.id)
  end
end
