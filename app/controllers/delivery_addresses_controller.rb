class DeliveryAddressesController < ApplicationController
  def new

  end

  def create
    @delivery_address = Delivery_address.create(delivery_address_params)
  end

  def edit
    @user = User.find(current_user.id)
    @delivery_address = Delivery_address.find(user_id: current_user.id)
  end

  def update

  end


  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :region, :city, :block, :building, :address_phone_number)
  end
end
