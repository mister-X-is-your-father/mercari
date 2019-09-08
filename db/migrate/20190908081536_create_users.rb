class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :nickname               null: false
      t.string   :email                  null: false, unique: true
      t.string   :password               null: false
      t.string   :password_confirmation  null: false
      t.string   :kan_familyname         null: false
      t.string   :kan_firstname          null: false
      t.string   :kana_familyname        null: false
      t.string   :kana_firstname         null: false
      t.date     :birth_day              null: false
      t.string   :phone_number                        unique: true
      t.string   :avator                 
      t.text     :profile                
      t.integer  :point                  
      t.timestamps
    end
  end
end
