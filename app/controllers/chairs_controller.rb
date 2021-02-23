class ChairsController < ApplicationController
  def index
    @chairs = Chair.all
  end

  def show
    @chair = Chair.find(params[:id])
  end

  def new
    @chair = Chair.new
  end

  def create
    @chair = Chair.new(chair_params)
    @user = current_user
    @chair.user = @user
    @chair.save
    redirect_to chair_path(@chair)
  end

  def chair_params
    params.require(:chair).permit(:name, :location, :description, :price, :photo)
  end
end
