FactoryBot.define do
  factory :search do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year_from { FFaker::Time.between(Date.current - 10.years, Date.current - 5).year }
    year_to { FFaker::Time.between(Date.current - 5, Date.current).year }
    price_from { FFaker::Random.rand(1..7000) }
    price_to { FFaker::Random.rand(7000..999_999) }
    requests_quantity { FFaker::Random.rand(10) }

    trait :with_user do
      association :user
    end
  end
end
