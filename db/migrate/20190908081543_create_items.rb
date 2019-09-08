class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name               null: false
      t.integer     :price              null: false
      t.integer     :tax                null: false
      t.integer     :product_condition  null: false
      t.text        :description        null: false
      t.boolean     :sold_condition     null: false
      t.references  :small_category_id  null: false, foreign_key: true
      t.references  :brand_id                        foreign_key: true
      t.references  :delivery_id        null: false, foreign_key: true
      t.references  :image_id           null: false, foreign_key: true
      t.references  :user_id            null: false, foreign_key: true
      t.references  :buyer_id                        foreign_key: true
      t.integer     :size_id                         foreign_key: true
      t.timestamps
    end
  end
end
