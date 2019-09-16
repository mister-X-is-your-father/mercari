class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :card
  has_one :user_address
  has_one :delivery_address

  validates :nickname,
            :email,
            :password,
            :password_confirmation,
            :kan_familyname,
            :kan_firstname,
            :kana_familyname,
            :kana_firstname,
            :birth_day, presence: true


  validates :email, :phone_number, uniqueness: true
  validates :kan_familyname, :kan_firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_familyname, :kana_firstname, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { in: 10..11 }
end
