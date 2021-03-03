require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録ができる時' do
      it '全ての項目を入力していると商品を出品できる' do
        @item.save
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'imageを一枚つけないと商品登録ができない' do
        
      end

      it '商品名が空だと登録ができない' do
        
      end

      it '商品説明が空だと登録ができない' do
        
      end

      it 'カテゴリーの情報が空だと登録ができない' do
        
      end

      it '商品の状態の情報が空だと登録ができない' do
        
      end

      it '配送料の負担についての情報が空だと登録ができない' do
        
      end

      it '配送元の情報が空だと登録ができない' do
        
      end

      it '配送予定日数の情報が空だと登録ができない' do
        
      end

      it '価格の情報が空だと登録ができない' do
        
      end

      it '価格の範囲が¥300~¥9,999,999外だと登録ができない' do
        
      end

      it '販売価格は半角数字以外だと登録ができない' do
        
      end
    end
  end
end
