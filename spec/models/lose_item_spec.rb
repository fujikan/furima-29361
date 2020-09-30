require 'rails_helper'

RSpec.describe LoseItem, type: :model do
  before do
    @order = FactoryBot.build(:lose_item)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
       it "post_code、prefecture_id、city、address、phone_number、tokenが存在すれば登録できること" do
         expect(@order).to be_valid
       end
    end

    context '商品購入がうまくいかないとき' do

      it "post_codeが空では購入できないこと" do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it "prefecture_idが空では購入できないこと" do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では購入できないこと" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では購入できないこと" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では購入できないこと" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "post_codeが半角数字でないと購入できないこと" do
        @order.post_code = 'fdf-jodg'
        @order.valid?
        
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it "prefecture_idが1では購入できないこと" do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが全角でないと購入できないこと" do
        @order.city = 'dkfgjsd'
        @order.valid?
        expect(@order.errors.full_messages).to include("City is invalid")
      end

      it "phone_numberが全角でないと購入できないこと" do
        @order.phone_number = 'dkfgjsd'
        @order.valid?
        
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it "post_codeの数字が3文字-4文字でないと購入できないこと" do
        @order.post_code = '123-456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it "tokenが空では購入できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
