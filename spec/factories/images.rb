FactoryBot.define do

  factory :image do
    image    {File.open("#{Rails.root}/spec/fixtures/test.png")}
    item_id  {1}
  end

end