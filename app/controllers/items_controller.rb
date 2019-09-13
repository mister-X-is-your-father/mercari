class ItemsController < ApplicationController
  def index
    # @ladies = Category.find(1)
    # @ladies_items = @ladies.items.order("created_at DESC").limit(10)
    
    # ビューでの子要素の取り出しは 
    # - parents.children.each do |child|
      # = child.name
    # 孫要素の取り出しは
    # - child.children.each do |grandchild|
      # = grandchild.name
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.all()
    @images = @item.images.all()
  end

  def new
    @item = Item.new
    @images = @item.images.build
    @sizes = Size.all
    @category = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      params[:images][:image].each do |i|
        @item.images.create(image: i, item_id: @item.id)
      end
      redirect_to root_path
    else
      # @images = @item.images.build
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params 
    params.require(:item).permit(
      :name,
      :description, 
      :product_condition,
      :delivery_payee,
      :delivery_time, 
      :delivery_method,
      :price,
      images_attributes: {image:[]} 
    ).merge(user_id: current_user.id, category_id: category.id)
  end

end
