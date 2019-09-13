class RemoveTaxFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :tax, :integer
  end
end
