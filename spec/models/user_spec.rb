require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
      expect(@user.errors.full_messages).to include("Sei kanji can't be blank", 'Sei kanji is invalid')
    end
    it 'mei_kanjiが空では登録できない' do
      @user.mei_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kanji can't be blank", 'Mei kanji is invalid')
    end
    it 'sei_katakanaが空では登録できない' do
      @user.sei_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei katakana can't be blank", 'Sei katakana is invalid')
    end
    it 'mei_katakanaが空では登録できない' do
      @user.mei_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei katakana can't be blank", 'Mei katakana is invalid')
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
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
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

    it ' passwordが6文字以上であれば登録できること ' do
      @user.password = 'a1234567'
      @user.password_confirmation = 'a1234567'
      expect(@user).to be_valid
    end
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.sei_kanji = '田中'
      expect(@user).to be_valid
    end
    it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.mei_kanji = '太郎'
      expect(@user).to be_valid
    end
    it '名字のフリガナが全角（カタカナ）であれば登録できる' do
      @user.sei_katakana = 'タナカ'
      expect(@user).to be_valid
    end
    it '名前のフリガナが全角（カタカナ）であれば登録できる' do
      @user.mei_katakana = 'タロウ'
      expect(@user).to be_valid
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
