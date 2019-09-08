class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name               null: false
      t.integer     :price              null: false
      t.integer     :tax                null: false
      t.integer     :product_condition  null: false
      t.text        :description        null: false
      t.boolean     :sold_condition     null: false
      t.references  :category_id        null: false, foreign_key: true
      t.references  :region_id          null: false, foreign_key: true
      t.references  :brand_id                        foreign_key: true
      t.references  :user_id            null: false, foreign_key: true
      t.references  :buyer_id                        foreign_key: true
      t.references  :size_id                         foreign_key: true
      t.integer     :delivery_payee     null: false
      t.integer     :delivery_time      null: false
      t.integer     :delivery_method
      t.timestamps
    end
  end
end
