FactoryBot.define do
    factory :item do
      association :user
      association :category
      association :item_status
      association :shipping_charge
      association :prefecture
      association :day_to_ship
  
      name { Faker::Commerce.product_name }
      description { Faker::Lorem.paragraph }
      price { Faker::Number.between(from: 300, to: 9999999) }

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
end
  
  
  