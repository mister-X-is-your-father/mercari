class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer     :payee      null: false
      t.references  :region_id  null: false, foreign_key: true
      t.integer     :time       null: false
      t.references  :item_id    null: false, foreign_key: true
      t.integer     :method
      t.timestamps
    end
  end
end
