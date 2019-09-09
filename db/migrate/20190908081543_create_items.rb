class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,               null: false
      t.integer     :price,              null: false
      t.integer     :tax,                null: false
      t.integer     :product_condition,  null: false
      t.text        :description,        null: false
      t.boolean     :sold_condition,     null: false
      t.integer  :category_id,        null: false, foreign_key: true
      t.integer  :region_id,          null: false, foreign_key: true
      t.integer  :brand_id,                        foreign_key: true
      t.integer  :user_id,            null: false, foreign_key: true
      t.integer  :buyer_id,                        foreign_key: true
      t.integer  :size_id,                         foreign_key: true
      t.integer     :delivery_payee,     null: false
      t.integer     :delivery_time,      null: false
      t.integer     :delivery_method
      t.timestamps
    end
  end
end
