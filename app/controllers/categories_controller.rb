class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.includes(:category).where(category_id: category.id).page(params[:page]).per(120).order("created_at DESC")
  end
end
