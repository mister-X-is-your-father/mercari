class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer  :user_id,      null: false, foreign_key: true
      t.string      :postal_code
      t.string      :region
      t.string      :city
      t.string      :block
      t.string      :buildings
      t.timestamps
    end
  end
end
