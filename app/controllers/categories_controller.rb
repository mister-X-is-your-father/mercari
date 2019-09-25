class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parents = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.id).page(params[:page]).per(120).order("created_at DESC").includes(:images)
  end
end
