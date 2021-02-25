class ChairsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_chair, only: %i[show edit update destroy]
  def index
    @chairs = Chair.all
    @chairs = policy_scope(Chair).order(created_at: :desc)
    @markers = @chairs.geocoded.map do |chair|
      {
        lat: chair.latitude,
        lng: chair.longitude
      }
    end
  end

  def show
    @reservations = Reservation.new
    @chair = Chair.find(params[:id])
    authorize(@chair)
  end

  def new
    @chair = Chair.new
    authorize(@chair)
  end

  def edit
    authorize(@chair)
  end

  def create
    @chair = Chair.new(chair_params)
    @user = current_user
    @chair.user = @user
    @chair.save
    redirect_to chair_path(@chair)
    authorize @chair
  end

  def update
    authorize(@chair)
    @chair.update(chair_params)
    redirect_to chair_path(@chair)
  end

  def destroy
    authorize(@chair)
    @chair.destroy
    redirect_to chairs_url
  end

  private

  def set_chair
    @chair = Chair.find(params[:id])
  end

  def chair_params
    params.require(:chair).permit(:name, :location, :description, :price, :photo)
  end
end
