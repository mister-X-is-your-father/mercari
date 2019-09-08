class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.text        :comment  null: false
      t.references  :user_id  null: false,  foreign_key: true
      t.references  :item_id  null: false,  foreign_key: true
      t.timestamps
    end
  end
end
