class ChairsController < ApplicationController
  before_action :set_chair, only: %i[ show edit update destroy ]
  def index
    @chairs = Chair.all
    @chairs = policy_scope(Chair).order(created_at: :desc)
  end

  def show
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

  def destroy
    @chair.destroy
    authorize(@chair)
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
