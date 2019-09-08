class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|

      t.timestamps
    end
  end
end
