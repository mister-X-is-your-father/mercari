class ItemsController < ApplicationController

  def index
    @parent_categories = Category.roots
    
    # ビューでの子要素の取り出しは 
    # - parents.children.each do |child|
      # = child.name
    # 孫要素の取り出しは
    # - child.children.each do |grandchild|
      # = grandchild.name
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments
    @images = @item.images
  end

  def new
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

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @sold_condition = Sold_Condition.all
  end

  def update
  end

  def destroy
  end

  def search
    @items = Item.search(params[:search])
  end

  private
  def item_params 
    params.require(:item).permit(
      :name,
      :description, 
      :product_condition,
      :category_id,
      :region_id,
      :brand_id,
      :size_id,
      :delivery_payee,
      :delivery_time,
      :delivery_method,
      :price,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end

end