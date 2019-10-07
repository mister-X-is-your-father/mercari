require 'rails_helper'

describe Item do

  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user: user, category: category)
      expect(item).to be_valid
    end

  end

end