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

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '姓（全角）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include(" Last name kana can't be blank")
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '姓（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include(" Last name kana can't be blank")
      end

      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 7 characters)')
      end
    
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが半角英字のみでは登録できないこと' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        expect(@user.errors.full_messages).to include("Cannot register with a password containing full-width characters")
      end
    
      it 'パスワードが半角数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user.errors.full_messages).to include("Cannot register with a password containing full-width characters")
      end
    
      it 'パスワードに全角文字を含むと登録できないこと' do
        @user.password = 'paｓｓｗｏｒｄ123'
        @user.password_confirmation = 'paｓｓｗｏｒｄ123'
        expect(@user.errors.full_messages).to include("Cannot register with a password containing full-width characters")
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('MailEmail is invalid')
      end
    end
  end
end