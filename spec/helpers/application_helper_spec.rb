RSpec.describe ApplicationHelper, type: :helper do
  describe '#sortable' do
    context 'when current column is not sorted' do
      it 'returns a link with ASC direction' do
        allow(helper).to receive(:params).and_return({ controller: 'cars', action: 'index' })
        expect(helper.sortable('year')).to have_link('Year', href: '/?order_by=year&direction=ASC')
      end
    end
    #
    #   context 'when current column is sorted in ASC direction' do
    #     before do
    #       allow(helper).to receive(:params).and_return({ order_by: 'name', direction: 'ASC' })
    #     end
    #
    #     it 'returns a link with DESC direction' do
    #       result = helper.sortable('price')
    #       binding.pry
    #       expect(result).to have_link('Price', href: '/?order_by=price&direction=DESC')
    #     end
    #   end
    #
    #   context 'when current column is sorted in DESC direction' do
    #     before do
    #       allow(helper).to receive(:params).and_return({ order_by: 'price', direction: 'DESC' })
    #     end
    #
    #     it 'returns a link with ASC direction' do
    #       result = helper.sortable('price')
    #
    #       expect(result).to have_link('Price', href: '/?order_by=price&direction=ASC')
    #     end
    #   end
    # end
    #
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
end
