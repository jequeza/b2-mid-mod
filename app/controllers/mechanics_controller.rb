class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def new
    mechanic = Mechanic.find(params[:id])
    ride = MechanicRide.new(mechanic_id: params[:id], ride_id: params[:ride_id])
    ride.save
    redirect_to "/mechanics/#{mechanic.id}"
  end
end