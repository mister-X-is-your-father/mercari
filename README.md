# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|kan_fullname|string|null: false|
|kana_fullname|string|null: false|
|birth_day|date|null: false|
|address|string|null: false|
|phone_number|string|unique:true|
|building_name|string||
|avator|string||
|access_code|string||
|publishable_key|string||
|stripe_customer_id|string||
- has_many :items
- has_many :reviews


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|tax|integer|null: false|
|product_condition|integer|null: false|
|description|text|null: false|
|sold_condition|boolean|null: false|
|size_id|references|foreign_key: true|
|small_category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|delivery_id|references|null: false, foreign_key: true|
|image_id|references|null: false, foreign_key: true|
|user_id|references|null: false , foreign_key: true|
|buyer_id|references|foreign_key: true|
- has_many :item_comments
- has_many :likes
- has_many :images
- belongs_to :user
- belongs_to :small_category


## deliveryテーブル
|Column|Type|Options|
|------|----|-------|
|payee|integer|null: false|
|region_id|references|null: false, foreign_key: true|
|time|integer|null: false|
|item_id|references|null: false|
|method|intger|null: false|
- belongs_to :item

## regionテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|
has_many :items

## user_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|comment|text|null: false|
|user_id|references|foreign_key: true|
- belongs_to :user


## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
- belongs_to :item
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|like|bool|null: false|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
- belongs_to :item
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|foreign_key: true|
- belongs_to :item

## small_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|foreign_key: true|
|middle_category_id|references|foreign_key: true|
- has_many :items
- belongs_to :middle_category

## middle_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|foreign_key: true|
|big_category_id|references|foreign_key: true|
- has_many :small_categories
- belongs_to :big_category

## big_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|foreign_key: true|
- has_many :middle_categories

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|small_category_id|references|foreign_key: true|
- belongs_to :small_categories
- has_many :items