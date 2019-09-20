class ChangeBirthdayDateType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_day, :string, null: false
  end
end
