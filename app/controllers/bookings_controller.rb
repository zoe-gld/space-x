class BookingsController < ApplicationController
  before_action :set_space, :set_user

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = @user
    if @booking.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to space_path(@space)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to space_path(@space)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_space
    @space = Space.find(params[:space_id])
  end

  def set_user
    @user = current_user
  end

end
