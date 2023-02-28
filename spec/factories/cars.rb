FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    odometer { Faker::Vehicle.mileage }
    price { Faker::Commerce.price(range: 10_000..100_000).to_i }
    description { Faker::Vehicle.drive_type }
    date_added { Faker::Date.in_date_period }
  end
end
