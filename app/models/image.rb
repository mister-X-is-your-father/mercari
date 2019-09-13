class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader #指定したカラムに対してアップローダを使うための宣言
end
