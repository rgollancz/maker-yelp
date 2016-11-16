class RestaurantsController < ApplicationController

  def all
    @restaurants = Restaurant.all
  end

  def new
    if !user_signed_in?
      redirect_to '/restaurants/all'
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to '/restaurants/all'
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location)
  end

end
