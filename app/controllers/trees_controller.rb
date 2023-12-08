class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :edit, :update, :destroy]
  def index
    @trees = Tree.where(user: current_user)
  end

  def show
    # @tree = tree.find(params[:id])
    if @tree.user == current_user
      @bookings = @tree.bookings
    end
  end

  # def search
  #   if params[:localisation]
  #     if params[:price] != ""
  #       @trees = Tree.where(["geoloc= ? and price= ?", params[:localisation],  params[:price]])
  #       # raise
  #     elsif params[:size] != ""
  #       @trees = Tree.where(["geoloc= ? and taille= ?", params[:localisation],  params[:size].to_i])
  #       # raise
  #     elsif params[:price] && params[:size]
  #       @trees = Tree.where(["geoloc= ? and taille= ? and price= ?", params[:localisation],  params[:size].to_i], params[:price])
  #       # raise
  #     else
  #       #with only localisation
  #       @trees = Tree.where(geoloc: params[:localisation])
  #       # raise
  #     end
  #   end
  #     render :trees
  # end

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
    params.require(:tree).permit(:titre, :taille, :price, :address, :description, :image)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end

end
