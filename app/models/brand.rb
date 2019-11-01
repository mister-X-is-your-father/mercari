class Brand < ApplicationRecord
  has_many :items
  belongs_to :item
end
