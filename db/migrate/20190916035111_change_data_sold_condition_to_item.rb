class ChangeDataSoldConditionToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :sold_condition, :integer
  end
end
