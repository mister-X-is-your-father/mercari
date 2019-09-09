class BrandsController < ApplicationController
  def index
    @brands = Brand.order("name")
    
  end
end
