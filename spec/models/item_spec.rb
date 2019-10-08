require 'rails_helper'

describe Item do

  describe '#create' do

    before do 

    end

    it "is valid with full fill" do
      user = create(:user)
      category = create(:category)
      region = create(:region)
      # images = create(:image)
      images = attributes_for(:image, {image: "test"})
      item = create(:item, user: user, category: category, region: region, images: images)
      expect(item).to be_valid
    end

  end

end