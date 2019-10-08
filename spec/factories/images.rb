FactoryBot.define do

  factory :image do
    image    {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png'), 'image/png')}
    # item_id  {1}
  end

end