class PagesController < ApplicationController
  before_action :set_tree, only: [:show, :edit, :update, :destroy]
  def home
    @trees = Tree.all

    if params[:localisation]
      # raise
          if params[:min_price] != "" || params[:max_price] != ""
            @trees = Tree.where(["geoloc= ? and price >= ? and price <= ?", params[:localisation],  params[:min_price], params[:max_price]])
            # raise
          elsif params[:min_size] != "" || params[:max_size] != ""
            @trees = Tree.where(["geoloc= ? and taille >= ? and taille <= ?", params[:localisation],  params[:min_size].to_i, params[:max_size].to_i])
            # raise
          elsif params[:min_price] != "" || params[:max_price] != "" && params[:min_size] != "" || params[:max_size] != ""
            @trees = Tree.where(["geoloc= ? and taille= ? and price= ?", params[:localisation],  params[:min_size].to_i, params[:max_size].to_i], params[:min_price], params[:max_price])
            # raise
            # we want to see only available trees
          elsif  params[:start_date] != "" && params[:end_date] != ""
            @trees = Tree.where(["geoloc= ? ", params[:localisation]])
            @trees = @trees.reject do |tree|
              tree.bookings.any? do |booking|
                booking_overlaps?(booking, params[:start_date], params[:end_date])
              end
            end
          else
            #with only localisation
            @trees = Tree.where(geoloc: params[:localisation].downcase)
            #  raise
          end
        end

  end

  def show
    # @tree = tree.find(params[:id])
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    if @tree.save
    redirect_to trees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @tree = tree.find(params[:id])
  end

  def update
    # @tree = tree.find(params[:id])
    @tree.update(tree_params)
    redirect_to trees_path
  end

  def destroy
    # @tree = tree.find(params[:id])
    @tree.destroy
    redirect_to trees_path, status: :see_other
  end

  private

  def tree_params
    params.require(:tree).permit(:titre, :taille, :price, :geoloc, :description)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end

  def booking_overlaps?(booking, start_date, end_date)
    booked_dates = (booking.start_date..booking.end_date).to_a
    requested_dates = (Date.parse(start_date)..Date.parse(end_date)).to_a
    requested_dates.any? do |date|
      booked_dates.include? date
    end
  end

end
