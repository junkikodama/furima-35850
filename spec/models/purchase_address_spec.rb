require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
      
    describe '商品購入' do
      context '商品購入出来る' do
        it '全ての項目が埋まっていれば商品購入出来る' do
          expect(@purchase).to be_valid
        end
        it '建物名(build)以外の全ての項目が埋まっていれば商品購入出来る' do
          @purchase.build = ''
          expect(@purchase).to be_valid
        end
        it '電話番号が10桁ではなく11桁でも、全ての項目が埋まっていれば商品購入出来る' do
          @purchase.phone_number = '08033533849'
          expect(@purchase).to be_valid
        end
      end
  
      context '商品購入出来ない' do
        it '郵便番号(postal_code)が空では商品購入出来ない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号(postal_code)が3桁ハイフン4桁ではなく、ハイフンが抜けていたら商品購入出来ない' do
          @purchase.postal_code = '5450021'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号(postal_code)が3桁ハイフン4桁ではなく、ハイフンの位置が異なっている場合は商品購入出来ない' do
          @purchase.postal_code = '5450-021'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号(postal_code)に全角ハイフンを使用していたら商品購入出来ない' do
          @purchase.postal_code = '545ー0021'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号(postal_code)に全角数字を使用していたら商品購入出来ない' do
          @purchase.postal_code = '５４５-００２１'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end

        it '都道府県(prefecture_id)が空では出品出来ない' do
          @purchase.prefecture_id = 1
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it '市区町村(city)が空では商品購入出来ない' do
          @purchase.city = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("City can't be blank")
        end

        it '番地(block)が空では商品購入出来ない' do
          @purchase.block = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Block can't be blank")
        end

        it '電話番号(phone_number)が空では商品購入出来ない' do
          @purchase.phone_number = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号(phone_number)が9桁以下では商品購入出来ない' do
          @purchase.phone_number = '066624680'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号(phone_number)が12桁以上では商品購入出来ない' do
          @purchase.phone_number = '066624680000'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号(phone_number)が全角数字では商品購入出来ない' do
          @purchase.phone_number = '０６６６２４６８００'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end

        it 'トークンが空では商品購入出来ない' do
          @purchase.token = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end

        it 'user_idが空では商品購入出来ない' do
          @purchase.user_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では商品購入出来ない' do
          @purchase.item_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end