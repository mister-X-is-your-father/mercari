class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        password = Devise.friendly_token[0, 20]
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: password,
          password_confirmation: password
        )
        SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    return user
  end

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
