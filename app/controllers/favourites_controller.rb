class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def create
    @favourite = Favourite.new
    @car = Car.find(params[:car_id])
    @favourite.car = @car
    if @favourite.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end
end
