class SpotsController < ApplicationController
  def new
    @spot = Spot.new
    @plan = Plan.find(params[:plan_id])
    @trip = Trip.find(params[:trip_id])
  end

  def create
  end

  def destroy
  end
end
