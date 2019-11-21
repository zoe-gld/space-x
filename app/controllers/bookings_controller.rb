class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_space

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save
      redirect_to space_path(@space, anchor: 'booking')
    else
      @review = Review.new
      @reviewed_booking = Booking.where(user: current_user, space: @space).last
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
    @booking.update(booking_params)
    if @booking.update(booking_params)
      redirect_to space_path(@space, anchor: 'booking')
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    # redirect_to space_path(@space, anchor: 'booking')
    redirect_to request.referer
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
