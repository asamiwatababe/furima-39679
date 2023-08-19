FactoryBot.define do
  factory :item do
    name                  { '服' }
    description           { 'まだ使えます' }
    category_id           { 2 }
    item_status_id        { 2 }
    shipping_charge_id    { 2 }
    prefecture_id         { 2 }
    day_to_ship_id        { 2 }
    price                 { 50000 }

    association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
end
  
  
  