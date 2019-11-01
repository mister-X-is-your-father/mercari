class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  require 'wikipedia'

  def index
    @categories = Category.all
    @parents = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @info = wiki(@category.name)
    if @category.is_root?
      parents = Category.find_by(id: @category.id).subtree
      @items = Item.where(category_id: parents).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    elsif @category.has_parent? && @category.has_children?
      children = Category.find_by(id: @category.id).subtree
      @items = Item.where(category_id: children).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    else
      @items = Item.where(category_id: @category.id).page(params[:page]).per(120).order("created_at DESC").includes(:images)
    end
  end

  private

  def wiki(category)
    Wikipedia.configure {
      domain 'ja.wikipedia.org'
      path 'w/api.php'
    }

    page = Wikipedia.find(category)
    return page.summary
  end
end
