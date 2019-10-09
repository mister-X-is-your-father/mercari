require 'rails_helper'

describe Item do

  before(:each) do 
    @user = create(:user)
    @category = create(:category)
    @region = create(:region)
  end

  describe '#create' do

    it "is valid with full fill" do
      item = build(:item, user: @user, category: @category, region: @region)
      expect(item).to be_valid
    end

  end

end