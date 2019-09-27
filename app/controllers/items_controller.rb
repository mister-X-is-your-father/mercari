class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @parent_categories = Category.roots
    # ビューでの子要素の取り出しは

    # - parents.children.each do |child|
      # = child.name
    # 孫要素の取り出しは
    # - child.children.each do |grandchild|
      # = grandchild.name

    ladies = Category.find_by(name: "レディース").subtree
    @ladies_items = Item.where(category_id: ladies).limit(10).order("created_at DESC").includes(:images)
    mens = Category.find_by(name: "メンズ").subtree
    @mens_items = Item.where(category_id: mens).limit(10).order("created_at DESC").includes(:images)
    canon = Category.find_by(name: "家電・スマホ・カメラ").subtree
    @canon_items = Item.where(category_id: canon ).limit(10).order("created_at DESC").includes(:images)
    toy = Category.find_by(name: "おもちゃ・ホビー・グッズ").subtree
    @toy_items = Item.where(category_id: toy).limit(10).order("created_at DESC").includes(:images)
    chanel = Brand.find_by(name: "シャネル")
    @chanel_items = Item.where(brand_id: chanel).limit(10).order("created_at DESC").includes(:images)
    vuitton = Brand.find_by(name: "ルイ ヴィトン")
    @vuitton_items = Item.where(brand_id: vuitton).limit(10).order("created_at DESC").includes(:images)
    car = Brand.find_by(name: "アイ")
    @car_items = Item.where(brand_id: car).limit(10).order("created_at DESC").includes(:images)
    nike = Brand.find_by(name: "ナイキ")
    @nike_items = Item.where(brand_id: nike).limit(10).order("created_at DESC").includes(:images)
  end

  def show
    @sold_condition = Sold_Condition.all
    @comments = @item.item_comments
    @images = @item.images
  end

  def new
    @item = Item.new
    @images = @item.images.build
    @sizes = Size.all
    @brands = Brand.all
    @parent_categories = Category.where(ancestry: nil)
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
    @images = @item.images
    @sizes = Size.all
    @brands = Brand.all
    @parent_categories = Category.where(ancestry: nil)
    @parent_category = Category.find_by(id: @item.category_id).root.id 
    @child_categories = Category.find_by(id: @item.category_id).root.children
    @child_category = Category.find_by(id: @item.category_id).parent.id
    @grandchild_categories = Category.find_by(id: @item.category_id).parent.children
    @regions = Region.all
    render layout: "register-layout"
  end

  def update
    respond_to do |format|
      if @item.update(edit_params)
        format.html{ redirect_to root_path }
      else
        format.html{render :edit_item}
      end
    end
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

  def get_child_categories
    @child_categories = Category.find(params[:parent_category]).children
  end

  def get_grandchild_categories
    @grandchild_categories = Category.find(params[:child_category]).children
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

  def edit_params
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
      images_attributes: [:image, :_destory, :id]
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end