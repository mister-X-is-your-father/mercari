require 'rails_helper'

describe User do
 describe '#create' do

  it "is valid with a nickname, email, password, password_confirmation, kan_familyname, kan_firstname, kana_familyname, kana_firstname, birth_day" do
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

  it "is invalid without a kan_familyname" do
    user = build(:user, kan_familyname: nil)
    user.valid?
    expect(user.errors[:kan_familyname]).to include("can't be blank")
  end

  it "is invalid without a kan_firstname" do
    user = build(:user, kan_firstname: nil)
    user.valid?
    expect(user.errors[:kan_firstname]).to include("can't be blank")
  end

  it "is invalid without a kana_familyname" do
    user = build(:user, kana_familyname: nil)
    user.valid?
    expect(user.errors[:kana_familyname]).to include("can't be blank")
  end

  it "is invalid without a kana_firstname" do
    user = build(:user, kana_firstname: nil)
    user.valid?
    expect(user.errors[:kana_firstname]).to include("can't be blank")
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
