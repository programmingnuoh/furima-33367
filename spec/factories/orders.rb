FactoryBot.define do
  factory :order do
    transient do
      addresses { Gimei.address }
    end
    post_code { '111-1111' }
    prefecture_id { rand(1..48) }
    city { addresses.city }
    address { addresses.town }
    building { '青山ハイツ304' }
    phone_number { '00011112222' }
    token { "tok_abcdefghijk0000000000000000" }
    user_id {1}
    item_id {1}
  end
end
