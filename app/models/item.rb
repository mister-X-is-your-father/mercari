class Item < ApplicationRecord
  has_many :item_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :region
  belongs_to :size
  accepts_nested_attributes_for :images #itemのフォーム画面でネストされたフォームを作成でき、image情報も同時に送信できる
end
