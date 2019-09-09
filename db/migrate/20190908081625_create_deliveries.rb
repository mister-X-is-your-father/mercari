class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer     :payee,      null: false
      t.integer  :region_id,  null: false, foreign_key: true
      t.integer     :time,       null: false
      t.integer  :item_id,    null: false, foreign_key: true
      t.integer     :method
      t.timestamps
    end
  end
end
