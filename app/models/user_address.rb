class UserAddress < ApplicationRecord
  belongs_to :user

  validates :postal_code, length: { is: 7 }
end
