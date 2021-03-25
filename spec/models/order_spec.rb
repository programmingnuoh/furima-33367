require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '購入できるとき' do
      it '必要な情報をすべて入力していれば新規登録できる' do
        expect(@order).to be_valid
      end

      it 'buildingが空でも登録ができること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '購入できない時' do
      it 'post_codeが空だと購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank", "Post code 例）123-4567")
      end

      it 'post_codeに-が入っていないと登録できないこと' do
        @order.post_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code 例）123-4567")
      end

      it 'prefectureが空だと購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに-が入っていると登録できないこと' do
        @order.phone_number = '000-1111-2222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上では登録ができないこと' do
        @order.phone_number = '000011112222333333'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが英数字混同では登録できないこと' do
        @order.phone_number = '0a0aaa00000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと登録ができないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
