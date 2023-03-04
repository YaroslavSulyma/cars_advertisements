RSpec.describe CarQuery do
  describe '#call' do
    subject(:result) { described_class.new.call(params).records }

    let!(:car1) { create(:car, odometer: 200_000, year: 2010, price: 10_000, created_at: 1.day.ago) }
    let!(:car2) { create(:car, odometer: 75_000, year: 2015, price: 15_000, created_at: 2.days.ago) }
    let!(:car3) { create(:car, odometer: 50_000, year: 2018, price: 20_000, created_at: 3.days.ago) }
    let!(:car4) { create(:car, odometer: 20_000, year: 2020, price: 25_000, created_at: 4.days.ago) }

    context 'with search params' do
      let(:params) { { make: car1.make, model: car1.model } }

      it 'returns cars that match search params' do
        expect(result).to eq([car1])
      end
    end

    context 'with filter params' do
      let(:params) { { year_from: 2015, year_to: 2018, price_from: 15_000, price_to: 20_000 } }

      it 'returns cars that match filter params' do
        expect(result).to eq([car2, car3].sort_by(&:created_at))
      end
    end

    context 'ordering' do
      let(:params) { {} }

      context 'if price asc' do
        let(:params) { { order_by: 'price', direction: 'asc' } }

        it 'returns cars ordered by the price asc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:price))
        end
      end

      context 'if price desc' do
        let(:params) { { order_by: 'price', direction: 'desc' } }

        it 'returns cars ordered by the price desc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:price).reverse)
        end
      end

      context 'if year asc' do
        let(:params) { { order_by: 'year', direction: 'asc' } }

        it 'returns cars ordered by the year asc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:year))
        end
      end

      context 'if year desc' do
        let(:params) { { order_by: 'year', direction: 'desc' } }

        it 'returns cars ordered by the year desc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:year).reverse)
        end
      end

      context 'if created_at asc' do
        let(:params) { { order_by: 'created_at', direction: 'asc' } }

        it 'returns cars ordered by the created_at asc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:created_at))
        end
      end

      context 'if created_at desc' do
        let(:params) { { order_by: 'created_at', direction: 'desc' } }

        it 'returns cars ordered by the created_at desc' do
          expect(result).to eq([car1, car2, car3, car4].sort_by(&:created_at).reverse)
        end
      end

      it 'orders by the default order attribute if no order param is passed' do
        expect(result).to eq([car1, car2, car3, car4].sort_by(&:created_at))
      end
    end

    context 'with pagination params' do
      it_behaves_like 'paginatable',
                      'Car',
                      described_class::DEFAULT_ORDER_ATTRIBUTE,
                      described_class::DEFAULT_DIRECTION
    end
  end
end
