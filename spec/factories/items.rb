FactoryBot.define do
  factory :item do
    name { Faker::Games::Pokemon.name }
    info { Faker::Games::Pokemon.location }
    category_id { rand(1..9) }
    sales_status_id { rand(1..6) }
    shipping_fee_status_id { rand(1..2) }
    prefecture_id { rand(1..47) }
    scheduled_delivery_id { rand(1..3) }
    price { rand(300..9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(‘public/image/image.jpg’), filename: ‘image.jpg’)
    end
  end
end