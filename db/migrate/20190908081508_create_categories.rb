class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table       :categories do |t|
      t.string      :name,       null: false
      t.integer  :item_id,                 foreign_key: true
      t.integer  :size_id,                 foreign_key: true
      t.string      :ancestory  
      t.timestamps
    end
  end
end
