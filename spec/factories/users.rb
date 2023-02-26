FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    passord { Faker::Internet.password(6, 128) }

    trait :with_search_history do
      after(:create) do |user|
        create_list(:search, 3, user:)
      end
    end
  end
end
