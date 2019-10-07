FactoryBot.define do
  factory :product_image do
    images { [Faker::Name.name,Faker::Name.name,Faker::Name.name] }
    product_id { 1 }
  end
end