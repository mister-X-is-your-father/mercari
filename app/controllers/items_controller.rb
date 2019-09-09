class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(10)
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
  end

  def new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # def item_params 
  #   params.require(;item).permit(:name, :description, 
  #     :product_condition, :delivery_payee, :delivery_time, 
  #     :delivery_method, :price)
  #     .merge(user_id: current_user.id, category_id: )
  # end
end
