FactoryBot.define do
  factory :order do
    item_id        { 1 }
    user_id        { 1 }
    zip_code       { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id  { Faker::Number.between(from: 1, to: 47)}
    city           { Faker::Address.city}
    street         { Faker::Address.street}
    building_name  { Faker::Address.building_number}
    telephone      { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }  

    #association :item
    #association :user
  end
end