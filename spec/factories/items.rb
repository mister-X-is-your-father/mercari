FactoryBot.define do

  factory :item do
    name                  {Faker::Name.name}
    price                 {rand(300..9999999)}
    product_condition     {1} #新品、未使用
    description           {Faker::Lorem.paragraph(sentence_count: 2)}
    sold_condition        {1} #出品中
    category
    region
    brand_id              {5788} #ユニクロ
    user
    buyer_id              {nil}
    size_id               {5} #M
    delivery_payee        {1} #送料込み(出品者負担)
    delivery_time         {1} #1~2日で発送
    delivery_method       {5} #クロネコヤマト
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end

end