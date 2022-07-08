FactoryBot.define do
  factory :item do
    title                 { Faker::Lorem.characters(number: 1..40) }
    description           { Faker::Lorem.characters(number: 1..1000) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    fee_id                { Faker::Number.between(from: 2, to: 3) }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    condition_id          { Faker::Number.between(from: 2, to: 7) }
    from_id               { Faker::Number.between(from: 2, to: 48) }
    shipdate_id           { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
