require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
context '商品が投稿できる場合' do
  it 'カテゴリーが空でも保存できる' do
    @item.category = ''
    expect(@item).to be_valid
  end
  it '商品名が空でも保存できる' do
    @item.name = ''
    expect(@item).to be_valid
  end
  it '画像が空でも保存できる' do
    @item.image = nil
    expect(@item).to be_valid
  end
end
context '商品が投稿できない場合' do
  it '商品眼と画像が空では保存できない' do
    @item.name = ''
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("name can't be blank")
  end
  it 'カテゴリーが空では登録できない' do
    @item.category = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Category can't be blank"
  end
  it '商品の状態が空では登録できない' do
    @item.item_status = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Item_status can't be blank"
  end
  it '商品名が空では登録できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Name can't be blank"
  end
  it '配送料が空では登録できない' do
    @item.shipping_charge = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping_charge can't be blank"
  end
  it '都道府県が空では登録できない' do
    @item.prefecture = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Prefecture can't be blank"
  end
  it '価格が空では登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Price can't be blank"
  end
  it '発送日が空では登録できない' do
    @item.day_to_ship = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Day_to_ship can't be blank"
  end
 end
end