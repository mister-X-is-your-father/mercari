FactoryBot.define do
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