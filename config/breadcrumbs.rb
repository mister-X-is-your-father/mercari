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

crumb :mypage_item_list do
  link "出品した商品 - 出品中", mypage_listings_listing_path
  parent :mypage
end

crumb :mypage_logout do
  link "ログアウト", mypage_mypage_logout_path
  parent :mypage
end

crumb :search do
  link params[:search], search_items_path
end

# crumb :categories do
#   link "カテゴリー一覧", categories_path
# end

# crumb :brands do
#   link "ブランド一覧", brands_path
# end

# crumb :item do |item|
#   link item.name, item_path(item)
# end


# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).