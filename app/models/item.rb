class Item < ApplicationRecord
  has_many :item_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :region
  belongs_to :size, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name,         presence: true,  length: { in: 1..40 } 
  validates :description,  presence: true,  length: { in: 1..1000 } 
  validates :price,        presence: true, numericality: { 
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9999999,
               } 
  validates :product_condition, 
            :category_id,
            :region_id,
            :sold_condition,
            :user_id,
            :delivery_payee,
            :delivery_time,
            :delivery_method, presence: true
  validates :images, length: { minimum: 1 }

  def self.search(search)
    return Item.order(created_at: "DESC").limit(24) unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end
end
