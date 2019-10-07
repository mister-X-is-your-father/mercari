FactoryBot.define do

  factory :user do
    password = "hanako1234"

    id                     {1}     
    nickname               {"ヤマハナ"}
    email                  {Faker::Internet.email}
    password               {password}
    password_confirmation  {password}
    kan_familyname         {"山田"}
    kan_firstname          {"花子"}
    kana_familyname        {"ヤマダ"}
    kana_firstname         {"ハナコ"}
    birth_day              {"20000131"}
    phone_number           {"11122223333"}
    postal_code            {"542-0076"}
    region                 {"27"}
    city                   {"大阪市中央区"}
    block                  {"難波5-1-60"}
  end
end