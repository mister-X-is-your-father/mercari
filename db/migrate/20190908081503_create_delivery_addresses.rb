class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer  :user_id,               null: false, foreign_key: true
      t.string      :postal_code,           null: false
      t.string      :region,                null: false
      t.string      :city,                  null: false
      t.string      :block,                 null: false
      t.string      :buildings             
      t.string      :address_phone_number  
      t.timestamps
    end
  end
end
