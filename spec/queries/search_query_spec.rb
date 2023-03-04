RSpec.describe SearchQuery do
  describe '#call' do
    subject(:result) { described_class.new.call(params).records }

    let(:search1) { create(:search, updated_at: 1.day.ago) }
    let(:search2) { create(:search, updated_at: 2.days.ago) }

    context 'ordering' do
      let(:params) { {} }

      it 'orders by the default search attribute if no order param is passed' do
        expect(result).to eq([search1, search2].sort_by(&:updated_at))
      end
    end

    context 'with pagination params' do
      it_behaves_like 'paginatable',
                      'Search',
                      described_class::DEFAULT_ORDER_ATTRIBUTE,
                      described_class::DEFAULT_DIRECTION
    end
  end
end
