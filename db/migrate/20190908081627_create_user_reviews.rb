class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.integer       :rate       null: false
      t.text          :comment
      t.references    :user_id    null: false, foreign_key: true
      t.timestamps
    end
  end
end
