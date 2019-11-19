class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_space


  def create
    @review = Review.new(review_params)
    @review.booking = Booking.where(user: current_user).last
    if @review.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.update(review_params)
      redirect_to space_path(@space)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to space_path(@space)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end


