class Category < ApplicationRecord
  has_many :items
  has_many :sizes_categories
  has_many :sizes, through: :sizes_categories
  has_ancestry

end
