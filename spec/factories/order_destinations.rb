FactoryBot.define do
  factory :order_destination do
    token        { 'tok_abcdefghijk00000000000000000' }
    post_code    { '123-4567' }
    from_id      { Faker::Number.between(from: 2, to: 48) }
    city         { Faker::Address.city }
    address_line { Faker::Address.street_address }
    phone        { '09000000000' }
    building     { 'マンション101' }
  end
end
