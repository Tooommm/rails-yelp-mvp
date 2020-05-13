class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])
    @total = []
    if @restaurant.reviews.empty?
      @moyenne = "No ratings"
    else
      @restaurant.reviews.each do |review|
        @total << review.rating
      end
      @moyenne = " #{(@total.sum + 0.0) / @total.size} / 5"
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant created!'
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
