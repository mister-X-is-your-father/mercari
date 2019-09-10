class BrandsController < ApplicationController
  def index
    @brands = Brand.order("name")
  end

  def show
    @brand = Brand.find(params[:id])
    @items = Item.includes(:brand).where(brand_id: brand.id).page(params[:page]).per(120).order("created_at DESC")
  end
end
