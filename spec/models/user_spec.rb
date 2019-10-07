require 'rails_helper'

describe User do
 describe '#create' do

  it "is valid with a nickname, email, password, password_confirmation, kan_familyname, kan_firstname, kana_familyname, kana_firstname, birth_day, phone_number, postal_code, region, city, block" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a nickname" do
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without a password_confirmation although with a password" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "is invalid with a password that has less than 7 characters" do
    user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa")
    user.valid?
    expect(user.errors[:password][0]).to include("is too short")
  end

  it "is valid with a password that has more than 6 characters " do
    user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
    expect(user).to be_valid
  end

  it "is invalid without a kan_familyname" do
    user = build(:user, kan_familyname: nil)
    user.valid?
    expect(user.errors[:kan_familyname]).to include("can't be blank")
  end

  it "is invalid with a kan_familyname that includes alphanumeric characters" do
    user = build(:user, kan_familyname: "abc@123")
    user.valid?
    expect(user.errors[:kan_familyname][0]).to include("is invalid")
  end

  it "is invalid without a kan_firstname" do
    user = build(:user, kan_firstname: nil)
    user.valid?
    expect(user.errors[:kan_firstname]).to include("can't be blank")
  end

  it "is invalid with a kan_firstname that includes alphanumeric characters" do
    user = build(:user, kan_firstname: "abc@123")
    user.valid?
    expect(user.errors[:kan_firstname][0]).to include("is invalid")
  end

  it "is invalid without a kana_familyname" do
    user = build(:user, kana_familyname: nil)
    user.valid?
    expect(user.errors[:kana_familyname]).to include("can't be blank")
  end

  it "is invalid with a kana_familyname that contains kanji" do
    user = build(:user, kana_familyname: "山田")
    user.valid?
    expect(user.errors[:kana_familyname][0]).to include("is invalid")
  end

  it "is invalid with a kana_familyname that contains hiragana" do
    user = build(:user, kana_familyname: "やまだ")
    user.valid?
    expect(user.errors[:kana_familyname][0]).to include("is invalid")
  end

  it "is invalid with a kana_familyname that contains alphanumeric characters" do
    user = build(:user, kana_familyname: "abc@123")
    user.valid?
    expect(user.errors[:kana_familyname][0]).to include("is invalid")
  end

  it "is invalid without a kana_firstname" do
    user = build(:user, kana_firstname: nil)
    user.valid?
    expect(user.errors[:kana_firstname]).to include("can't be blank")
  end

  it "is invalid with a kana_firstname that contains kanji" do
    user = build(:user, kana_firstname: "花子")
    user.valid?
    expect(user.errors[:kana_firstname][0]).to include("is invalid")
  end

  it "is invalid with a kana_firstname that contains hiragana" do
    user = build(:user, kana_firstname: "はなこ")
    user.valid?
    expect(user.errors[:kana_firstname][0]).to include("is invalid")
  end

  it "is invalid with a kana_firstname that contains alphanumeric characters" do
    user = build(:user, kana_firstname: "abc@123")
    user.valid?
    expect(user.errors[:kana_firstname][0]).to include("is invalid")
  end

  it "is invalid without a birth_day" do
    user = build(:user, birth_day: nil)
    user.valid?
    expect(user.errors[:birth_day]).to include("can't be blank")
  end

  it "is invalid without a phone_number" do
    user = build(:user, phone_number: nil)
    user.valid?
    expect(user.errors[:phone_number]).to include("can't be blank")
  end

  it "is invalid with dashes on phone_number" do
    user = build(:user, phone_number: "111-1111-1111")
    user.valid?
    expect(user.errors[:phone_number][0]).to include("is invalid")
  end

  it "is invalid with a phone_number that has less than 10 characters" do
    user = build(:user, phone_number: "111222333")
    user.valid?
    expect(user.errors[:phone_number][0]).to include("is invalid")
  end

  it "is invalid with a phone_number that has more than 11 characters" do
    user = build(:user, phone_number: "111222233334")
    user.valid?
    expect(user.errors[:phone_number][0]).to include("is invalid")
  end

  it "is invalid without a postal_code" do
    user = build(:user, postal_code: nil)
    user.valid?
    expect(user.errors[:postal_code]).to include("can't be blank")
  end

  it "is invalid with a postal_code without dash" do
    user = build(:user, postal_code: "1111111")
    user.valid?
    expect(user.errors[:postal_code][0]).to include("is invalid")
  end

  it "is invalid with a postal_code that has less than 8 characters" do
    user = build(:user, postal_code: "111-111")
    user.valid?
    expect(user.errors[:postal_code][0]).to include("is invalid")
  end

  it "is invalid with a postal_code that has more than 9 characters" do
    user = build(:user, postal_code: "1111-1111")
    user.valid?
    expect(user.errors[:postal_code][0]).to include("is invalid")
  end

  it "is invalid without a region" do
    user = build(:user, region: nil)
    user.valid?
    expect(user.errors[:region]).to include("can't be blank")
  end

  it "is invalid without a city" do
    user = build(:user, city: nil)
    user.valid?
    expect(user.errors[:city]).to include("can't be blank")
  end

  it "is invalid without a block" do
    user = build(:user, block: nil)
    user.valid?
    expect(user.errors[:block]).to include("can't be blank")
  end

  describe "email uniqueness"

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate phone_number" do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("has already been taken")
    end
  end

end
