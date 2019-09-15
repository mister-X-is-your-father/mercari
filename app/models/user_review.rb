class UserReview < ApplicationRecord
  belongs_to :user

  validates :rate, presence: true
end
