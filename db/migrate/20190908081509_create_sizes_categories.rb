class CreateSizesCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes_categories do |t|
      t.integer  :size_id,      null: false, foreign_key: true
      t.integer  :category_id,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
