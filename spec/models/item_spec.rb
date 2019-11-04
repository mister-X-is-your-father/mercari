require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:each) do 
    @user = create(:user)
    @category = create(:category)
    @region = create(:region)
  end

  describe '#create' do

    context "can save" do

      it "is valid with all properties" do
        item = build(:item, user: @user, category: @category, region: @region)
        expect(item).to be_valid
      end

      it "is valid with all properties and name of 40 characters" do
        item = build(:item, user: @user, category: @category, region: @region, name: Faker::Lorem.characters(number: 40))
        expect(item).to be_valid
      end

      it "is valid with all propeties and description of 1000 characters" do
        item = build(:item, user: @user, category: @category, region: @region, description: Faker::Lorem.characters(number: 1000))
        expect(item).to be_valid
      end

      it "is valid with all propeties and price of ¥300" do
        item = build(:item, user: @user, category: @category, region: @region, price: 300)
        expect(item).to be_valid
      end

      it "is valid with all propeties and price of ¥9,999,999" do
        item = build(:item, user: @user, category: @category, region: @region, price: 9999999)
        expect(item).to be_valid
      end

      it "is valid with all propeties and one image" do
        item = build(:item, user: @user, category: @category, region: @region)
        item.images = []
        item.images << build(:image, item: item)
        expect(item).to be_valid
      end

      it "is valid with all propeties and ten images" do
        item = build(:item, user: @user, category: @category, region: @region)
        item.images = []
        i = 0
        while i < 10 
          item.images << build(:image, item: item)
          i += 1
        end
        expect(item).to be_valid
      end

      it "is valid without a brand_id" do
        item = build(:item, user: @user, category: @category, region: @region, brand_id: nil)
        expect(item).to be_valid
      end

      it "is valid without a size_id" do
        item = build(:item, user: @user, category: @category, region: @region, size_id: nil)
        expect(item).to be_valid
      end

    end

    context "can not save" do

      it "is invalid without a name" do
        item = build(:item, user: @user, category: @category, region: @region, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "is invalid with a name that is more than 40 characters" do
        item = build(:item, user: @user, category: @category, region: @region, name: Faker::Lorem.characters(number: 41))
        item.valid?
        expect(item.errors[:name][0]).to include("is too long")
      end

      it "is invalid without a price" do
        item = build(:item, user: @user, category: @category, region: @region, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it "is invalid with a price that is less than ¥300" do
        item = build(:item, user: @user, category: @category, region: @region, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it "is invalid with a price that is more than ¥10,000,000" do
        item = build(:item, user: @user, category: @category, region: @region, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it "is invalid without a product_condition" do
        item = build(:item, user: @user, category: @category, region: @region, product_condition: nil)
        item.valid?
        expect(item.errors[:product_condition]).to include("can't be blank")
      end

      it "is invalid without a description" do
        item = build(:item, user: @user, category: @category, region: @region, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end

      it "is invalid with a description that is more than 1,000 characters" do
        item = build(:item, user: @user, category: @category, region: @region, description: Faker::Lorem.characters(number: 1001))
        item.valid?
        expect(item.errors[:description][0]).to include("is too long")
      end

      it "is invalid without a sold_condition" do
        item = build(:item, user: @user, category: @category, region: @region, sold_condition: nil)
        item.valid?
        expect(item.errors[:sold_condition]).to include("can't be blank")
      end

      it "is invalid without a category_id" do
        item = build(:item, user: @user, region: @region)
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end

      it "is invalid without a region_id" do
        item = build(:item, user: @user, category: @category)
        item.valid?
        expect(item.errors[:region_id]).to include("can't be blank")
      end

      it "is invalid without a user_id" do
        item = build(:item, category: @category, region: @region)
        item.valid?
        expect(item.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without a delivery_payee" do
        item = build(:item, user: @user, category: @category, region: @region, delivery_payee: nil)
        item.valid?
        expect(item.errors[:delivery_payee]).to include("can't be blank")
      end

      it "is invalid without a delivery_time" do
        item = build(:item, user: @user, category: @category, region: @region, delivery_time: nil)
        item.valid?
        expect(item.errors[:delivery_time]).to include("can't be blank")
      end

      it "is invalid without a delivery_method" do
        item = build(:item, user: @user, category: @category, region: @region, delivery_method: nil)
        item.valid?
        expect(item.errors[:delivery_method]).to include("can't be blank")
      end

      it "is invalid without a image" do
        item = build(:item, user: @user, category: @category, region: @region)
        item.images = []
        item.valid?
        expect(item.errors[:images]).to include("can't be blank")
      end

      it "is invalid with images more than 10" do
        item = build(:item, user: @user, category: @category, region: @region)
        item.images = []
        i = 0
        while i <= 10 
          item.images << build(:image, item: item)
          i += 1
        end
        item.valid?
        expect(item.errors[:images][0]).to include("is too long")
      end

    end

  end

end