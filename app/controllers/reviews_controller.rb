class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_space, :set_reviewed_booking

  def create
    @review = Review.new(review_params)
    @review.booking = @reviewed_booking
    if @review.save
      redirect_to space_path(@space, anchor: 'about')
    else
      @taken_dates = @space.bookings.map { |booking| booking.date }
      @booking = Booking.new
      @markers = [{
          lat: @space.latitude,
          lng: @space.longitude
        }]
      render 'spaces/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.update(review_params)
      redirect_to space_path(@space, anchor: 'about')
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to space_path(@space, anchor: 'about')
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_reviewed_booking
    @reviewed_booking = Booking.where(user: current_user, space: @space).last
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
