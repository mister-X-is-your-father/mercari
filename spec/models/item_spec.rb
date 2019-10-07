require 'rails_helper'

describe Item do

  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = create(:user)
      category = create(:category)
      region = create(:region)
      item = build(:item, user: user, category: category, region: region)
      expect(item).to be_valid
    end

  end

end