require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品が投稿できる場合' do
    it '画像と名前を保存できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が投稿できない場合' do
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'カテゴリーが空では登録できない' do
      @item.category = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が空では登録できない' do
      @item.item_status = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item_status can't be blank")
    end

    it '配送料が空では登録できない' do
      @item.shipping_charge_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_charge can't be blank")
    end

    it '都道府県が空では登録できない' do
      @item.prefecture = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '発送日が空では登録できない' do
      @item.day_to_ship = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day_to_ship can't be blank")
    end

    it '商品の説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
  end
end