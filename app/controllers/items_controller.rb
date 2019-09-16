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
    @categories = Category.all
    @regions = Region.all
    @product_conditions = {
      "新品、未使用":1,
      "未使用に近い":2,
      "目立った傷や汚れなし":3,
      "やや傷や汚れあり":4,
      "傷や汚れあり":5,
      "全体的に状態が悪い":6
    }
    @delivery_payee = {
      "送料込み(出品者負担)":1, 
      "着払い(購入者負担)":2 
    }
    @delivery_method_if_seller = {
      "未定":1,
      "らくらくメルカリ便":2,
      "ゆうメール":3,
      "レターパック普通郵便(定形、定形外)":4,
      "クロネコヤマト":5,
      "ゆうパック":6,
      "クリックポスト":7,
      "ゆうパケット":8
      } 
    @delivery_time = {
      "1~2日で発送":1,
      "2~3日で発送":2,
      "4~7日で発送":3
    }
    render layout: "register-layout"
  end

  def create
    # Item.create(item_params)
    # redirect_to root_path
    @item = Item.new(item_params)
    if @item.save
      params[:images][:image].each do |i|
        @images = @item.images.create(image: i)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @sold_condition = {
      "出品中":1,
      "取引中":2,
      "売却済":3,
      "公開停止中":4
    }
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
      :category_id,
      :region_id,
      :brand_id,
      :size_id,
      :delivery_payee,
      :delivery_time,
      :delivery_method,
      :price,
      images_attributes: [:image, :_destroy, :id]
    ).merge(user_id: 1)
  end

end