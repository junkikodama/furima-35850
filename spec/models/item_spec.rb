require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    
  describe '商品出品' do
    context '出品出来る' do
      it '全ての項目が埋まっていれば出品出来る' do
        expect(@item).to be_valid
      end
    end

    context '出品出来ない' do
      it '商品画像(image)が空では出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名(name)が空では出品出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明(description)が空では出品出来ない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー(category_id)が空では出品出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態(status_id)が空では出品出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料負担(charge_id)が空では出品出来ない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 1')
      end
      it '発送元地域情報(prefecture_id)が空では出品出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送必要日数(duration_id)が空では出品出来ない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Duration must be other than 1')
      end
      it '価格が空では出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では出品出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格が9,999,999円より高い場合は出品出来ない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '価格が全角数字では出品出来ない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英数混合では出品出来ない' do
        @item.price = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が英語のみでは出品出来ない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
