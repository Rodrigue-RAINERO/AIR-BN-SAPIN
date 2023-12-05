class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
    # @booking = booking.find(params[:id])
  end

  def new
    @tree = Tree.find(params[:tree_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tree = Tree.find(params[:tree_id])
    @booking.tree = @tree
    if @booking.save
      redirect_to tree_path(@tree)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @booking = booking.find(params[:id])
  end

  def update
    # @booking = booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price )
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
