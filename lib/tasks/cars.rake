namespace :cars do
  desc 'Add cars to DB'
  task :create, [:count_of_cars] => :environment do |_task, args|
    count_of_cars = Integer(args[:count_of_cars] || 1)
    cars = []
    count_of_cars.times { cars << car }
    Car.create(cars)

    Rails.logger.debug { "#{count_of_cars} cars was added to DB" }
  end

  desc 'Clear cars DB'
  task clear: :environment do
    Car.destroy_all

    Rails.logger.debug 'Cars table cleared'
  end
end

def car
  {
    make: FFaker::Vehicle.make,
    model: FFaker::Vehicle.model,
    year: FFaker::Vehicle.year,
    odometer: FFaker::Random.rand(999_999),
    price: FFaker::Random.rand(999_999),
    description: FFaker::Lorem.phrase
  }
end
