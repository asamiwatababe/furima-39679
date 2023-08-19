FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 1, to: 10) }
    item_status_id        { Faker::Number.between(from: 1, to: 5) }
    shipping_charge_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 47) }
    day_to_ship_id        { Faker::Number.between(from: 2, to: 3) }
    price                 { Faker::Number.between(from: 100, to: 100000) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end