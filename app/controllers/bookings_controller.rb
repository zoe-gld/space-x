class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_space

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    if @booking.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.update(booking_params)
      redirect_to space_path(@space)
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to space_path(@space)
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
