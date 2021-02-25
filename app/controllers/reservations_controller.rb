class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservations = policy_scope(Reservation).order(created_at: :desc)
  end

  def new
    @chair = Chair.find(params[:chair_id])
    @reservations = Reservation.new
    authorize(@reservation)
  end

  def edit
    authorize(@reservation)
  end

  def create
    @chair = Chair.find(params[:chair_id])
    @reservation = Reservation.new(reservation_params)
    @reservations.chair = @chair
    authorize(@reservation)
    if @reservation.save
      render :show
    else
      render :new
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :chair_id, :start_date, :end_date, :total_price, :approved)
  end

end




