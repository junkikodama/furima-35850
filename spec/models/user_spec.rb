require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    
  describe 'ユーザー新規登録' do
    context '新規登録出来る' do
      it '全ての項目が埋まっていれば新規登録出来る' do
        expect(@user).to be_valid
      end
    end

    context '新規登録出来ない' do
      it 'nicknameが空では登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録出来ない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合は登録出来ない' do
        @user.email = 'techcamp.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録出来ない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字が混合していない場合は登録出来ない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致していない場合は登録出来ない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でない場合は登録出来ない' do
        @user.last_name = 'ｵﾊﾖｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でない場合は登録出来ない' do
        @user.first_name = 'ｵﾊﾖｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが空では登録出来ない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが空では登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが全角(カタカナ)でない場合は登録出来ない' do
        @user.last_name_kana = 'ｵﾊﾖｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角(カタカナ)でない場合は登録出来ない' do
        @user.first_name_kana = 'ｵﾊﾖｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birthdayが空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end

end
