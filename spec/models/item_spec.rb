require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品が投稿できる場合' do
    it '全ての項目が入力されていれば出品できる' do
      @item.category_id = 1  # カテゴリーの適切な値を設定
      @item.item_status_id = 1  # 商品の状態の適切な値を設定
      @item.name = 'Example Item'
      @item.shipping_charge_id = 1  # 配送料の適切な値を設定
      @item.prefecture_id = 1  # 都道府県の適切な値を設定
      @item.price = 1000
      @item.day_to_ship_id = 1  # 発送日の適切な値を設定
      @item.description = 'This is an example item.'
      @item.image = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example_image.jpg'), 'image/jpeg')  # 画像のアップロードをシミュレート

      expect(@item).to be_valid
    end
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

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '1a2b3c'  # 数字以外を含む価格を設定
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格が300円未満では出品できない' do
      @item.price = 299  # 300未満の価格を設定
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 10_000_000  # 9,999,999を超える価格を設定
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
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

    it 'userが紐付いていなければ出品できない' do
      @item.user = nil  # userを紐付けていない状態にする
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end