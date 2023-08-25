require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form) 
  end

  context '商品が購入できる場合' do
    it 'building_nameが空でも保存できる' do
      expect(@order_form).to be_valid
    end
  end

  context '商品が購入できない場合' do
    it 'zip_codeが空では登録できない' do
      @order_form.zip_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Zip code can't be blank")
    end

    it 'zip_codeは半角数字以外が含まれている場合は購入できない' do
      @order_form.zip_code = '1a2b3c'  # 数字以外を含むzipcodeを設定
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end

    it '都道府県が空では登録できない' do
      @order_form.prefecture_id = '1'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では登録できない' do
      @order_form.city = ''
      @order_form.valid? 
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'telephoneが空では登録できない' do
      @order_form.telephone = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone can't be blank")
    end

    it 'telephoneは半角数字以外が含まれている場合は購入できない' do
      @order_form.telephone = '1a2b3c'  
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone is invalid. Include hyphen(-)")
    end

    it 'streetが空では登録できない' do
      @order_form.street = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street can't be blank")
    end

    it 'userが紐付いていなければ購入できない' do
      @order_form.user_id = nil  # userを紐付けていない状態にする
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できない' do
      @order_form.item_id= nil  # itemを紐付けていない状態にする
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end