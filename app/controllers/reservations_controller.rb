class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @chair = Chair.new(params[:chair_id])
    @reservations = Reservation.new
  end

end
