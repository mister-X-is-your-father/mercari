class EditorController < ApplicationController

  def edit
    @item = Item.new
    @images = @item.images.build
    @sizes = Size.all
    @brands = Brand.all

    @parent_categories_array = Category.where(ancestry: nil).pluck(:name)
    @child_categories_array = Category.where.not(ancestry: nil).pluck(:name)
    @grandchild_categories = Category.where.not(ancestry: nil)
    @regions = Region.all
    render layout: "register-layout"
  end

end