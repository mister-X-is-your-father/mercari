class UserAddress < ApplicationRecord
  belongs_to :user

  validates :postal_code, length: { is: 7 }, format: { with: /\A\d{7}\z/ }
end
