require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  context '商品出品がうまくいくとき' do
    it '全ての項目が入力されていれば購入ができる' do
      expect(@item_order).to be_valid
    end
    it 'buildingnameが空でも登録できる' do
      @item_order.buildingname = ''
      expect(@item_order).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'token(クレジットカード情報)が空だと購入ができない' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空だと購入ができない' do
      @item_order.postcode = ''
      @item_order.valid?
      expect(@item_order.errors.messages).to include(postcode: ["can't be blank", 'is invalid. Include hyphen(-)'])
    end
    it 'postcodeにハイフンがないと登録できない' do
      @item_order.postcode = '12345678'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it 'postcodeが8桁でないと購入できない' do
      @item_order.postcode = '123-458'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空だと購入できない' do
      @item_order.prefecture_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalitiesが空だと購入できない' do
      @item_order.municipalities = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと購入できない' do
      @item_order.address = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'telephonenumberが空だと購入できない' do
      @item_order.telephonenumber = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephonenumber can't be blank")
    end
    it 'telephonenumberが11桁でなければ購入できない' do
      @item_order.telephonenumber = '080123456789'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Telephonenumber is invalid')
    end
  end
end
