crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_top_path
end

crumb :mypage_profile do
  link "プロフィール", mypage_edit_profile_path
  parent :mypage
end

crumb :mypage_card do
  link "支払い方法", new_mypage_card_path
  parent :mypage
end

crumb :mypage_identification do
  link "本人情報の登録", mypage_edit_identification_path
  parent :mypage
end

crumb :mypage_logout do
  link "ログアウト", mypage_mypage_logout_path
  parent :mypage
end

crumb :mypage_itemList do
  link "出品した商品 - 出品中", mypage_listings_listing_path
  parent :mypage
end

crumb :mypage_itemList_item do
  link "出品商品画面", item_path
  parent :mypage_itemList
end



crumb :search do
  link params[:search], search_items_path
end

crumb :item do |item|
  link item.name, item_path(item.id)
end

crumb :categories do
  link "カテゴリー一覧", categories_path
end

# crumb :brands do
#   link "ブランド一覧", brands_path
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).