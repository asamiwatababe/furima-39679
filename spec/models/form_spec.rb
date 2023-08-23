require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @order_form = OrderForm.new
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @order_form.item_id = 1
        @order_form.user_id = 1
        @order_form.zip_code = '123-4567'
        @order_form.prefecture_id = 1
        @order_form.city = 'Sample City'
        @order_form.telephone = '1234567890'
        @order_form.street = 'Sample Street'
        expect(@order_form).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @order_form.item_id = 1
        @order_form.user_id = 1
        @order_form.zip_code = '123-4567'
        @order_form.prefecture_id = 1
        @order_form.city = 'Sample City'
        @order_form.telephone = '1234567890'
        @order_form.street = 'Sample Street'
        @order_form.building_name = '' # Ensure it's an empty string
        expect(@order_form).to be_valid
      end
    end

    context '内容に間違いがある場合' do
      it 'item_idが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.item_id = nil
        expect(@order_form).not_to be_valid
      end

      it 'user_idが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.user_id = nil
        expect(@order_form).not_to be_valid
      end

      # Add more validation tests for other attributes

      it 'streetが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.street = nil
        expect(@order_form).not_to be_valid
      end

      it 'userが紐付いていなければ出品できない' do
        # Similar attribute assignments as above
        @order_form.user_id = nil
        expect(@order_form).not_to be_valid
      end

      it 'itemが紐付いていなければ出品できない' do
        # Similar attribute assignments as above
        @order_form.item_id = nil
        expect(@order_form).not_to be_valid
      end

      it 'cityが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.city = nil
        expect(@order_form).not_to be_valid
      end

      it 'prefecture_idが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.prefecture_id = nil
        expect(@order_form).not_to be_valid
      end

      it 'telephoneが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.telephone = nil
        expect(@order_form).not_to be_valid
      end

      it 'zip_codeが空の場合は登録できない' do
        # Similar attribute assignments as above
        @order_form.zip_code = nil
        expect(@order_form).not_to be_valid
      end
    end
  end
end