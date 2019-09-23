class Mypage::ListingsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).order("created_at DESC").limit(10).includes(:images)
  end
end