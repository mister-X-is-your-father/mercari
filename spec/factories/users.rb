FactoryBot.define do

  factory :user do
    password = "hanako1234"

    nickname               {"ヤマハナ"}
    email                  {Faker::Internet.email}
    password               {password}
    password_confirmation  {password}
    kan_familyname         {"山田"}
    kan_firstname          {"花子"}
    kana_familyname        {"ヤマダ"}
    kana_firstname         {"ハナコ"}
    birth_day              {"20000131"} #誕生日記入機能未実装
    phone_number           {rand(1000000000..99999999999).to_s}
    avator                 {nil}
    profile                {nil}
    point                  {nil}
    postal_code            {"542-0076"}
    region                 {"27"} #大阪府
    city                   {"大阪市中央区"}
    block                  {"難波5-1-60"}
    buildings              {nil}
    address_phone_number   {nil}
  end
end