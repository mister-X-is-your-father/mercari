class RemoveCategoriesColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :item_id, :integer
    remove_column :categories, :size_id, :integer
    remove_column :sizes, :category_id, :integer  
  end
end
