require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
   context '商品出品がうまくいくとき' do
      it "image、name、description、category_id、condition_id、postage_id、prefecture_id、handling_time_id、priceが存在すれば登録できること" do
        expect(@item).to be_valid
      end

    end
    context '商品出品がうまくいかないとき' do

      it "nameが空では出品できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
       end

      it "descriptionが空では出品できないこと" do
       @item.description = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが1では出品できないこと" do
       @item.category_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idが1では出品できないこと" do
       @item.condition_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "postage_idが1では出品できないこと" do
       @item.postage_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "prefecture_idが1では出品できないこと" do
       @item.prefecture_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "handling_time_idが1では出品できないこと" do
       @item.handling_time_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("Handling time must be other than 1")
      end

      it "priceが空では出品できないこと" do
       @item.price = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが299以下では出品できないこと" do
       @item.price = '299'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "priceが10000000以上では出品できないこと" do
       @item.price = '10000000'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it "imageが空では出品できないこと" do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      
    end
  end
end
