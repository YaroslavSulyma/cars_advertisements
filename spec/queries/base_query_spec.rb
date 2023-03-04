RSpec.describe BaseQuery do
  let(:query) { described_class.new }

  describe '#call' do
    it 'should raises NotImplementedError' do
      expect { query.call }.to raise_error(NotImplementedError)
    end
  end
end
