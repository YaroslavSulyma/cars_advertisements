FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { FFaker::Random.rand(Car::MIN_YEAR..Date.current.year) }
    odometer { FFaker::Random.rand(999_999) }
    price { FFaker::Random.rand(999_999) }
    description { FFaker::Lorem.phrase }
  end
end
