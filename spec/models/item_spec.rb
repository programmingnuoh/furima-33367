require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録機能' do
    before do
      @item = FactoryBot.create(:item)
    end
    context '商品登録ができる時' do
      it '全ての項目を入力していると商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'imageを一枚つけないと商品登録ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録ができない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")        
      end

      it '商品説明が空だと登録ができない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")        
      end

      it 'カテゴリーの情報が空だと登録ができない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")        
      end

      it '商品の状態の情報が空だと登録ができない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料の負担についての情報が空だと登録ができない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '配送元の情報が空だと登録ができない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '配送予定日数の情報が空だと登録ができない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it '価格の情報が空だと登録ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が¥300~¥9,999,999外だと登録ができない' do
        @item.price = 200
        @item.valid?
        binding.pry
      end

      it '販売価格は半角数字以外だと登録ができない' do
        @item.price = １００
        @item.valid?
      end
    end
  end
end
