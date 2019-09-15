class DeliveryAddress < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: true, length: { is: 8 }, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :region, presence: true
  validates :block, presence: true
  validates :address_phone_number, length: { in: 10..11 }, format: { with: /\A\d{10,11}\z/ }
end
