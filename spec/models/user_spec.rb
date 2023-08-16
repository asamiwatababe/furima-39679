require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("FirstName can't be blank")
      end

      it 'first_nameが全角ひらがな、漢字、カタカナ以外の文字を含む場合、登録できない' do
        @user.first_name = 'John123'
        @user.valid?
        expect(@user.errors.full_messages).to include(" First name contains characters other than full-width hiragana, kanji, and katakana, registration is not possible")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'last_nameが全角ひらがな、漢字、カタカナ以外の文字を含む場合、登録できない' do
        @user.last_name = 'Doe123'
        e@user.valid?
        expect(@user.errors.full_messages).to include(" Last name contains characters other than full-width hiragana, kanji, and katakana, registration is not possible")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'first_name_kanaが全角カタカナでない場合、登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name kana is not in full-width katakana, cannot be registered")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'last_name_kanaが全角カタカナでない場合、登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is not in full-width katakana, cannot be registered")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが半角英字と数字の組み合わせでない場合、登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is not a combination of half-width letters and numbers, cannot be registered")
      end
    end
  end
end