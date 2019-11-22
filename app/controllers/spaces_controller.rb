class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :search, :show]
  before_action :set_space, only: [:show, :edit, :update]

  def home
    @spaces = Space.all.order(created_at: :desc).limit(5)
  end

  def index
    if params[:place].nil? || (params[:place] == "" && params[:cat] == "")
      @spaces = Space.all.order(created_at: :desc)
    elsif params[:place] == ""
      @spaces = Space.search(params[:cat])
    elsif params[:cat] == ""
      @spaces = Space.near(params[:place], 50)
    else
      @spaces = Space.search(params[:cat]) & Space.near(params[:place], 50)
    end

    @markers = @spaces.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude
      }
    end
  end

  def show
    @markers = [{
        lat: @space.latitude,
        lng: @space.longitude
      }]
    @booking = Booking.new
    @reviewed_booking = Booking.where(user: current_user, space: @space).last
    @review = Review.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to space_path(@space)
    else
      render 'edit'
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :description, :category, :price, :cover_image, :video_url, :published)
  end

  def set_space
    @space = Space.find(params[:id])
  end

  def empty_query(string)

  end

end
