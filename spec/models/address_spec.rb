require 'rails_helper'

describe Address do
  describe '#create' do
    #. postcodeが空では登録できないこと
    it "is invalid without a postcode" do
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    # . address_prefecturesが空では登録できないこと
    it "is invalid without a prefectures" do
      address = build(:address, address_prefecture: nil)
      address.valid?
      expect(address.errors[:address_prefecture]).to include("を入力してください")
    end

    # . address_cityが空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, address_city: nil)
      address.valid?
      expect(address.errors[:address_city]).to include("を入力してください")
    end

    # . address_blockが空では登録できないこと
    it "is invalid without a block" do
      address = build(:address, address_block: nil)
      address.valid?
      expect(address.errors[:address_block]).to include("を入力してください")
    end

    

  end
end