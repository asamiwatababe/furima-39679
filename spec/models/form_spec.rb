require 'rails_helper'

RSpec.describe Form, type: :model do
  subject(:form) { described_class.new }

  it "郵便番号がない場合、無効であること" do
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.street = "123 ストリート"
    form.telephone = "09012345678"
    expect(form).to be_invalid
    expect(form.errors[:zip_code]).to include("を入力してください")
  end

  it "無効な郵便番号フォーマットの場合、無効であること" do
    form.zip_code = "1234567"
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.street = "123 ストリート"
    form.telephone = "09012345678"
    expect(form).to be_invalid
    expect(form.errors[:zip_code]).to include("は無効です")
  end

  it "都道府県がない場合、無効であること" do
    form.zip_code = "123-4567"
    form.city = "サンプル市"
    form.street = "123 ストリート"
    form.telephone = "09012345678"
    expect(form).to be_invalid
    expect(form.errors[:prefecture_id]).to include("を入力してください")
  end

  it "市区町村がない場合、無効であること" do
    form.zip_code = "123-4567"
    form.prefecture_id = 1
    form.street = "123 ストリート"
    form.telephone = "09012345678"
    expect(form).to be_invalid
    expect(form.errors[:city]).to include("を入力してください")
  end

  it "番地がない場合、無効であること" do
    form.zip_code = "123-4567"
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.telephone = "09012345678"
    expect(form).to be_invalid
    expect(form.errors[:street]).to include("を入力してください")
  end

  it "建物名がない場合でも有効であること" do
    form.zip_code = "123-4567"
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.street = "123 ストリート"
    form.telephone = "09012345678"
    form.building_name = nil
    expect(form).to be_valid
  end

  it "電話番号がない場合、無効であること" do
    form.zip_code = "123-4567"
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.street = "123 ストリート"
    expect(form).to be_invalid
    expect(form.errors[:telephone]).to include("を入力してください")
  end

  it "無効な電話番号フォーマットの場合、無効であること" do
    form.zip_code = "123-4567"
    form.prefecture_id = 1
    form.city = "サンプル市"
    form.street = "123 ストリート"
    form.telephone = "090-1234-5678"
    expect(form).to be_invalid
    expect(form.errors[:telephone]).to include("は無効です")
  end
end
