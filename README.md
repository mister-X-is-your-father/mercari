# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|kan_familyname|string|null: false|
|kan_firstname|string|null: false|
|kana_familyname|string|null: false|
|kana_firstname|string|null: false|
|birth_day|date|null: false|
|phone_number|string|unique:true|
|avator|string||
|profile|text||
|point|integer||
- has_many :items, dependent: :destroy
- has_many :user_reviews, dependent: :destroy
- has_many :item_comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :card
- has_one :user_address
- has_one :delivery_address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|tax|integer|null: false|
|product_condition|integer|null: false|
|description|text|null: false|
|sold_condition|boolean|null: false|
|category_id|references|null: false, foreign_key: true|
|region_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|user_id|references|null: false , foreign_key: true|
|buyer_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|delivery_payee|integer|null: false|
|delivery_time|integer|null: false|
|delivery_method|integer||
- has_many :item_comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :region
- belongs_to :size

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
- belongs_to :user

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|string||
|region|string||
|city|string||
|block|string||
|building|string||
- belongs_to :user

## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|string|null: false|
|region|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|address_phone_number|string||
- belongs_to :user

## regionsテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|
has_many :items

## user_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|comment|text||
|user_id|references|null: false, foreign_key: true|
- belongs_to :user

## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
- belongs_to :item
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
- belongs_to :item
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string||
- has_many :items
- has_many :sizes_categories
- has_many :sizes, through: :sizes_categories
- has_ancestry

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :sizes_categories
- has_many :category, through: :sizes_categories
- has_many :items

## sizes_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
- belongs_to category
- belongs_to size