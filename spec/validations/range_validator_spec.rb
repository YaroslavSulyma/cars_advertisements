RSpec.describe RangeValidator do
  describe '.valid?' do
    subject(:result) { described_class.valid?(range_values) }

    context 'with valid range values' do
      let(:range_values) { { from: '10', to: '20' } }

      it 'returns true' do
        expect(result).to be_truthy
      end
    end

    context 'with invalid range values' do
      let(:range_values) { { from: '50', to: '30' } }

      it 'raises an error' do
        expect(result).to raise_error(RuntimeError, I18n.t('errors.invalid_range'))
      end
    end

    context 'with one valid range value' do
      let(:range_values) { { from: '10', to: '' } }

      it 'returns true' do
        expect(result).to be_truthy
      end
    end

    context 'with both range values missing' do
      let(:range_values) { { from: '', to: '' } }

      it 'raises an error' do
        expect(result).to raise_error(RuntimeError, I18n.t('errors.invalid_range'))
      end
    end

    context 'with non-numeric range values' do
      let(:range_values) { { from: '10', to: 'abc' } }

      it 'raises an error' do
        expect(result).to raise_error(RuntimeError, I18n.t('errors.invalid_range'))
      end
    end
  end
end
