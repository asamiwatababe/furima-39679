FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + 'A1' }
    password_confirmation { password }
    first_name            { 'やまだヤマダ山田' }
    last_name             { 'たろうタロウ太郎' }
    first_name_kana       { 'タロウ' }  
    last_name_kana        { 'ヤマダ' }  
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end