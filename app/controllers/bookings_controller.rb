class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @tree = Tree.find(params[:id])
  end

  def new
    @tree = Tree.find(params[:tree_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @tree = Tree.find(params[:tree_id])
    @booking.tree = @tree
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.join(', ')
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

  def destroy
    # @tree = tree.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
