class ChangeColumnsForUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :string, null: false
    add_column :users, :region, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :block, :string, null: false
    add_column :users, :buildings, :string
    add_column :users, :address_phone_number, :string
  end
end
