class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parents = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    if @category.is_root?
      parent = Category.find_by(id: @category.id).subtree
      @items = Item.where(category_id: parent).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    elsif @category.has_parent? && @category.has_children?
      child = Category.find_by(id: @category.id).subtree
      @items = Item.where(category_id: child).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    else
      @items = Item.where(category_id: @category.id).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    end
  end
end
