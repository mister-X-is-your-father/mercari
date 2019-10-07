FactoryBot.define do

  factory :item do
    name                  {"ロングコート"}
    price                 {"5000"}
    product_condition     {"1"} #新品、未使用
    description           {"レディースのロングコートです"}
    sold_condition        {"1"} #出品中
    category
    region
    brand_id              {"5788"} #ユニクロ
    user
    buyer_id              {""}
    size_id               {"5"} #M
    delivery_payee        {"1"} #送料込み(出品者負担)
    delivery_time         {"1"} #1~2日で発送
    delivery_method       {"5"} #クロネコヤマト
  end

  factory :item do
    name { Faker::Name.name }
    price { rand(100000) }
    product_condition { rand(3) }
    description { Faker::Lorem.paragraph(2) }
    sold_condition { rand(3) }
    category_id { 1 }
    region_id { 1 }
    brand_id { 1 }
    user_id { 1 }
    buyer_id { NULL }
    size_id { 1 }
    delivery_payee { 1 }
    delivery_time { 1 }
    delivery_method { 1 }
  end
end