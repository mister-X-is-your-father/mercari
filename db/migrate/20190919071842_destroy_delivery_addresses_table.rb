class DestroyDeliveryAddressesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :delivery_addresses
  end
end
