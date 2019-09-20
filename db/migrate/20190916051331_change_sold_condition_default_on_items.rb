class ChangeSoldConditionDefaultOnItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :sold_condition, :integer, default: 1
  end
end
