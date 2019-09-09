class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname,        :string,  null: false
    add_column :users, :kan_familyname,  :string,  null: false
    add_column :users, :kan_firstname,   :string,  null: false
    add_column :users, :kana_familyname, :string,  null: false
    add_column :users, :kana_firstname,  :string,  null: false
    add_column :users, :birth_day,       :date,    null: false
    add_column :users, :phone_number,    :string,  unique: true
    add_column :users, :avator,          :string
    add_column :users, :profile,         :text
    add_column :users, :point,           :integer
    add_column :users, :created_at,      :datetime, null: false
    add_column :users, :updated_at,      :datetime, null: false
  end
end
