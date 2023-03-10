FactoryBot.define do
  factory :item_order do
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 49) }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_address }
    buildingname { Faker::Address.street_address }
    telephonenumber { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
