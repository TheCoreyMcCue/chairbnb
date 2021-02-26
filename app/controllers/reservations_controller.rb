class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation).where(user_id: current_user.id).order(created_at: :desc)
    @listing = Chair.where(user: current_user)
    @requests = Reservation.joins(:chair).where(chair:{user: current_user})
    #@reservation = Reservation.find(params[:reservation_id])
  end

  def update

    @reservation = Reservation.find(params[:id])
    @reservation.approved = true
    authorize(@reservation)
    @reservation.save

  end


  def create
    @user = current_user
    @chair = Chair.find(params[:chair_id])
    @reservation = Reservation.create(reservation_params)
    @reservation.chair = @chair
    @reservation.user = @user
    authorize(@reservation)
    if @reservation.save

      redirect_to reservation_path(@reservation), notice: "Reservation was saved succsessfully!"
    else
      redirect_to chair_path(@chair), notice: "Could not create Reservation!"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)
    #@reservation = policy_scope(Reservation).order(created_at: :desc)
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




