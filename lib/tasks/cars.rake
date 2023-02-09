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
  make = Faker::Vehicle.make
  {
    make:,
    model: Faker::Vehicle.model(make_of_model: make),
    year: Faker::Vehicle.year,
    odometer: Faker::Vehicle.kilometrage,
    price: Faker::Commerce.price(range: 10_000..100_000).to_i,
    description: Faker::Vehicle.drive_type,
    date_added: Faker::Date.between(from: '2010-09-23', to: '2022-09-25')
  }
end
