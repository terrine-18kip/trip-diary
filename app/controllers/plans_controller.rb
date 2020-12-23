class PlansController < ApplicationController
  before_action :set_plan, only: [:edit, :update, :destroy]

  def create
    plan = Plan.create(plan_params)
    redirect_to edit_trip_path(plan.trip.id)
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to edit_trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    if editor_user?
      @plan.destroy
      redirect_to edit_trip_path(@plan.trip.id)
    end
  end

  def sort
    @plan = Plan.find(params[:id])
    spot = @plan.spots[params[:from].to_i]
    spot.insert_at(params[:to].to_i + 1)
    spot.save
    render body: nil
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
    @trip = Trip.find(@plan.trip.id)
  end

  def plan_params
    params.require(:plan).permit(:daily).merge(trip_id: params[:trip_id])
  end
end
