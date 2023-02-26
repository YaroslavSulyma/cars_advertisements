FactoryBot.define do
  factory :search do
    user { association :user, optional: true }
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year_from { Faker::Number.between(from: 1884, to: Date.current.year) }
    year_to { Faker::Number.between(from: year_from, to: Date.current.year) }
    price_from { Faker::Commerce.price.to_i }
    price_to { Faker::Commerce.price(range: price_from..100_000).to_i }
    requests_quantity { Faker::Number.between(from: 1, to: 10) }
  end
end
