class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @parent_categories = Category.roots
    # ビューでの子要素の取り出しは

    # - parents.children.each do |child|
      # = child.name
    # 孫要素の取り出しは
    # - child.children.each do |grandchild|
      # = grandchild.name

    ladies = Category.find_by(name: "レディース").subtree
    @ladies_items = Item.where(category_id: ladies).limit(10).includes(:images)
    mens = Category.find_by(name: "メンズ").subtree
    @mens_items = Item.where(category_id: mens).limit(10).includes(:images)
    canon = Category.find_by(name: "家電・スマホ・カメラ").subtree
    @canon_items = Item.where(category_id: canon ).limit(10).includes(:images)
    toy = Category.find_by(name: "おもちゃ・ホビー・グッズ").subtree
    @toy_items = Item.where(category_id: toy).limit(10).includes(:images)
    chanel = Brand.find_by(name: "シャネル")
    @chanel_items = Item.where(brand_id: chanel).limit(10).includes(:images)
    vuitton = Brand.find_by(name: "ルイ ヴィトン")
    @vuitton_items = Item.where(brand_id: vuitton).limit(10).includes(:images)
    car = Brand.find_by(name: "アイ")
    @car_items = Item.where(brand_id: car).limit(10).includes(:images)
    nike = Brand.find_by(name: "ナイキ")
    @nike_items = Item.where(brand_id: nike).limit(10).includes(:images)
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.item_comments
    @images = @item.images
    @region = Region
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
    respond_to do |format|
      if @item.save
        format.html{ redirect_to root_path }
      else
        format.html{render :new}
      end
    end
  end

  def edit
    @sold_condition = Sold_Condition.all
    @comments = @item.item_comments
    @images = @item.images
    @region = Region
  end

  def update
  end

  def destroy
    if @item.user_id == current_user.id
        @item.destroy
        redirect_to mypage_top_path
    else
      redirect_to root_path
    end

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

  def set_item
    @item = Item.find(params[:id])
  end

end