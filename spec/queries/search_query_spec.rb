RSpec.describe SearchQuery do
  describe '#call' do
    context 'with pagination params' do
      it_behaves_like 'paginatable', 'Search'
    end
  end
end
