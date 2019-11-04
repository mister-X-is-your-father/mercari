require 'rails_helper'

RSpec.describe Image, type: :model do

  describe '#create' do

    context "can save" do

      it "is valid with all properties" do
        image = build(:image)
        expect(image).to be_valid
      end

    end

    context "can not save" do

      it "is invalid without item" do
        image = build(:image, item_id: nil)
        image.valid?
        expect(image.errors[:item]).to include("must exist")
      end

    end

  end

end