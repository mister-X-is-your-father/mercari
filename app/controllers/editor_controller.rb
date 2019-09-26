class EditorController < ApplicationController

  def edit
    @item = Item.find_by(id: params[:id])
    @images = @item.images.build
    @sizes = Size.all
    @brands = Brand.all
    @parent_categories = Category.where(ancestry: nil)
    @regions = Region.all
    render layout: "register-layout"
  end

  def get_child_categories
    @child_categories = Category.find_by(id: params[:parent_category]).children
  end

  def get_grandchild_categories
    @grandchild_categories = Category.find_by(id: params[:child_category]).children
  end

end
