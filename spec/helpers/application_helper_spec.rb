RSpec.describe ApplicationHelper, type: :helper do
  describe '#sortable' do
    before do
      allow(request).to receive(:params).and_return({ controller: :cars, action: :index })
    end

    context 'when current column is not sorted' do
      it 'returns a link with ASC direction' do
        expect(helper.sortable('year')).to eq(link_to('Year', '/cars?direction=ASC&order_by=year'))
      end
    end

    context 'when current column is sorted in ASC direction' do
      before do
        allow(helper).to receive(:params).and_return({ order_by: 'year', direction: 'ASC' })
      end

      it 'returns a link with DESC direction' do
        expect(helper.sortable('year')).to eq(link_to('Year', '/cars?direction=DESC&order_by=year'))
      end
    end

    context 'when current column is sorted in DESC direction' do
      before do
        allow(helper).to receive(:params).and_return({ order_by: 'year', direction: 'DESC' })
      end

      it 'returns a link with ASC direction' do
        expect(helper.sortable('year')).to eq(link_to('Year', '/cars?direction=ASC&order_by=year'))
      end
    end
  end

  describe '#locale_options' do
    it 'returns an array of available locales' do
      expect(helper.locale_options).to eq([['Англійська', :en], ['Українська', :uk]])
    end
  end

  describe '#switch_locale_path' do
    it 'returns a path with the specified locale' do
      allow(helper).to receive(:controller_name).and_return(:cars)
      allow(helper).to receive(:action_name).and_return(:index)

      result = helper.switch_locale_path(:uk)

      expect(result).to eq('/uk/cars')
    end
  end
end
