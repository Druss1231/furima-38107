require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録されない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが既に登録されている' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含んでいないと登録されない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'a2345'
        @user.password_confirmation = 'a2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角が含まれると登録できない' do
        @user.password = 'ａａａａａ1'
        @user.password_confirmation = 'ａａａａａ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = 'a10000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'firstnameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.firstname = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end
      it 'lastnameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.lastname = 'TAROU'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end
      it 'firstname_kanaは全角（カタカナ）でないと登録できない' do
        @user.firstname_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it 'lastname_kanaは全角（カタカナ）でないと登録できない' do
        @user.lastname_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid')
      end
    end
  end
end
