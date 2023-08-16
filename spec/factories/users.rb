FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.email}
      password              {Faker::Internet.password(min_length: 6)+ 'A1'}
      password_confirmation {password}
    end
  end