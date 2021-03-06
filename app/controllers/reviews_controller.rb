class ReviewsController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def new
    @id = params[:restaurant_id]
  end

  def create
    @restaurant = Restaurant.find_by_id(params[:review][:id])
    if current_user.has_already_reviewed? @restaurant
      flash[:notice]='Have you left a review before? Just stop.'
      redirect_to '/restaurants'
    elsif @currentUser == @restaurant.user_id
      flash[:notice]='Is this your own restaurant? You cannot do that.'
      redirect_to '/restaurants'
    else
      User.create_review(@restaurant, @currentUser, review_params)
      redirect_to '/restaurants'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
