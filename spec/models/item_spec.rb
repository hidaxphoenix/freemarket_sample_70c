require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @user = create(:user)
  end

  describe '#create' do
    context 'can save' do
      it 'is valid with a name, description, category_id, condition, price, ship_charge, ship_area, ship_date, ship_method, user_id' do
        item = build(:item, user_id:@user.id)
        expect(item).to be_valid
      end

      # description
      # descriptionが1000文字以下なら登録できる
      it "is valid with a description that has less_than_or_equal_to 1000 characters " do
        item = build(:item, user_id:@user.id, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") # 1000文字
        expect(item).to be_valid
      end

      # name
      # nameが40文字以下なら登録できる
      it "is valid with a name that has less than 40 characters " do
        item = build(:item, user_id:@user.id, name: "やややややややややややややややややややややややややややややややややややややややや") # 40文字
        expect(item).to be_valid
      end

      # 300以上に設定してください
      it "is valid with a price that is greater_than_or_equal_to 300 " do
        item = build(:item, user_id:@user.id, price: "301")
        item.valid?
        expect(item).to be_valid
      end

      # 値を9999999以下に設定してください
      it "is valid with a price that is less_than_or_equal_to 9999999 " do
        item = build(:item, user_id:@user.id, price: "9999999")
        item.valid?
        expect(item).to be_valid
      end
    end

    context 'cannot save' do
        # 各項目入力されているかどうかのテスト
        # name
        it "is invalid without a name" do
          item = build(:item, name: nil)
          item.valid?
          expect(item.errors[:name]).to include("を入力してください")
        end
      
        # description
        it "is invalid without a description" do
          item = build(:item, description: nil)
          item.valid?
          expect(item.errors[:description]).to include("を入力してください")
        end

        # price
        it "is invalid without a price" do
          item = build(:item, price: nil)
          item.valid?
          expect(item.errors[:price]).to include("を入力してください")
        end

        # ship_charge
        it "is invalid without a ship_charge" do
          item = build(:item, ship_charge: nil)
          item.valid?
          expect(item.errors[:ship_charge]).to include("を入力してください")
        end

        # ship_area
        it "is invalid without ship_area" do
          item = build(:item, ship_area: nil)
          item.valid?
          expect(item.errors[:ship_area]).to include("を入力してください")
        end

        # ship_date
        it "is invalid without ship_date" do
          item = build(:item, ship_date: nil)
          item.valid?
          expect(item.errors[:ship_date]).to include("を入力してください")
        end

        # condition
        it "is invalid without a condition" do
          item = build(:item, condition: nil)
          item.valid?
          expect(item.errors[:condition]).to include("を入力してください")
        end

        # ship_method
        it "is invalid without a ship_method" do
          item = build(:item, ship_method: nil)
          item.valid?
          expect(item.errors[:ship_method]).to include("を入力してください")
        end

        # category_id
        it "is invalid without category_id" do
          item = build(:item, category_id: nil)
          item.valid?
          expect(item.errors[:category_id]).to include("を入力してください")
        end

      # nameが40文字超過なら不適切
      it "is invalid with a name that has too_long 41 characters" do
        item = build(:item, name: "ややややややややややややややややややややややややややややややややややややややややや") # 41文字
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      # descriptionが1000文字超過なら不適切
      it "is invalid with a description that has too_long 1001 characters" do
        item = build(:item, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") # 1001文字
        item.valid?
        expect(item.errors[:description]).to include("は1000文字以内で入力してください")
      end

      # price
      # 値が300未満なら不適切
      it "is invalid with a price that is greater_than_or_equal_to 300 " do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      # 10000000以上なら不適切    
      it "is invalid with a price is less_than_or_equal_to 9999999 " do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end
    end
  end
end