class Size < ApplicationRecord
  has_many :sizes_categories
  has_many :category, through: :sizes_categories
  has_many :items
end
