class Item < ApplicationRecord
  has_many :item_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :region
  belongs_to :size

  validates :name,         presence: true,  length: { in: 1..40 } 
  validates :description,  presence: true,  length: { in: 1..1000 } 
  validates :price,        presence: true, numericality: { 
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9999999,
               } 
  validates :production_condition, 
            :sold_condition,
            :category_id,
            :region_id,
            :user_id,
            :delivery_payee,
            :delivery_time,
            :delivery_method, presence: true
end
