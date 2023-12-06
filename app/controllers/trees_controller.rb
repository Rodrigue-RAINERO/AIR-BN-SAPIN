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
    params.require(:tree).permit(:titre, :taille, :price)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end

end
