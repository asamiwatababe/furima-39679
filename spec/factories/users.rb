FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + 'A1' }
    password_confirmation { password }
    first_name            { Faker::Japanese::Name.first_name }
    last_name             { Faker::Japanese::Name.last_name }
    first_name_kana       { 'タロウ' }  # ここに適切な全角カタカナを設定
    last_name_kana        { 'ヤマダ' }  # ここに適切な全角カタカナを設定
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end