RSpec.describe CarQuery do
  describe '#call' do
    subject(:query) { described_class.new }

    let!(:car1) { create(:car, odometer: 200_000, year: 2010, price: 10_000, date_added: 1.day.ago) }
    let!(:car2) { create(:car, odometer: 75_000, year: 2015, price: 15_000, date_added: 2.days.ago) }
    let!(:car3) { create(:car, odometer: 50_000, year: 2018, price: 20_000, date_added: 3.days.ago) }
    let!(:car4) { create(:car, odometer: 20_000, year: 2020, price: 25_000, date_added: 4.days.ago) }

    context 'with search params' do
      it 'returns cars that match search params' do
        params = { make: car1.make, model: car1.model }
        result = query.call(params).records

        expect(result).to contain_exactly(car1)
      end
    end

    context 'with filter params' do
      it 'returns cars that match filter params' do
        params = { year_from: 2015, year_to: 2018, price_from: 15_000, price_to: 20_000 }
        result = query.call(params).records

        expect(result).to contain_exactly(car2, car3)
      end
    end

    context 'ordering' do
      it 'returns cars ordered by the price asc' do
        params = { order_by: 'price', direction: 'asc' }
        result = query.call(params).records

        expect(result).to eq([car1, car2, car3, car4].sort_by(&:price))
      end

      it 'returns cars ordered by the price desc' do
        params = { order_by: 'price', direction: 'desc' }
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:price).reverse)
      end

      it 'returns cars ordered by the year asc' do
        params = { order_by: 'year', direction: 'asc' }
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:year))
      end

      it 'returns cars ordered by the year desc' do
        params = { order_by: 'year', direction: 'desc' }
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:year).reverse)
      end

      it 'returns cars ordered by the date_added asc' do
        params = { order_by: 'date_added', direction: 'asc' }
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:date_added))
      end

      it 'returns cars ordered by the date_added desc' do
        params = { order_by: 'date_added', direction: 'desc' }
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:date_added).reverse)
      end

      it 'orders by the default order attribute if no order param is passed' do
        params = {}
        result = query.call(params).records

        expect(result.records).to eq([car1, car2, car3, car4].sort_by(&:date_added))
      end
    end

    context 'with pagination params' do
      it_behaves_like 'paginatable', 'Car', 'date_added', 'asc'
    end
  end
end
