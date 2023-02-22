require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'sei_kanjiが空では登録できない' do
        @user.sei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kanji can't be blank")
      end
      it 'mei_kanjiが空では登録できない' do
        @user.mei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kanji can't be blank")
      end
      it 'sei_katakanaが空では登録できない' do
        @user.sei_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei katakana can't be blank")
      end
      it 'mei_katakanaが空では登録できない' do
        @user.mei_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei katakana can't be blank")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが空欄だと保存できない' do
        @user.password = 'a123456'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字だけだと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角入力だと登録できない' do
        @user.password = '１ａａａａａａａ'
        @user.password_confirmation = '１ａａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '名字が半角入力だと登録できない' do
        @user.sei_kanji = 'tanaka'
        @user.valid?
        expect(@user.errors[:sei_kanji]).to include('is invalid')
      end
      it '名前が半角入力だと登録できない' do
        @user.mei_kanji = 'tarou'
        @user.valid?
        expect(@user.errors[:mei_kanji]).to include('is invalid')
      end
      it '名字のフリガナがカタカナ以外の文字だと登録できない' do
        @user.sei_katakana = '田中'
        @user.valid?
        expect(@user.errors[:sei_katakana]).to include('is invalid')
      end
      it '名前のフリガナがカタカナ以外の文字だと登録できない' do
        @user.mei_katakana = '太郎'
        @user.valid?
        expect(@user.errors[:mei_katakana]).to include('is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end

    context '新規登録できるとき' do
      it ' passwordが6文字以上であれば登録できること ' do
        @user.password = 'a1234567'
        @user.password_confirmation = 'a1234567'
        expect(@user).to be_valid
      end
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
