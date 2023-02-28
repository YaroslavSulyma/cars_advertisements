RSpec.shared_examples 'paginatable' do |model_name, default_order_attribute, default_direction|
  let(:factory_name) { model_name.downcase.to_sym }
  let(:model_class) { model_name.constantize }

  describe '#paginate' do
    let!(:first_item) { FactoryBot.create(factory_name) }
    let!(:second_item) { FactoryBot.create(factory_name) }
    let!(:third_item) { FactoryBot.create(factory_name) }
    let(:initial_scope) { model_class.where(id: [first_item.id, second_item.id, third_item.id]) }
    let(:params) { { page: 1, items: 2 } }
    let(:ordered_scope) do
      if default_direction.present? && default_direction == 'asc'
        initial_scope.sort_by(&default_order_attribute.to_sym)
      elsif default_direction.present? && default_direction == 'desc'
        initial_scope.sort_by(&default_order_attribute.to_sym).reverse
      else
        initial_scope
      end
    end

    subject(:result) { described_class.new(initial_scope).call(params) }

    it 'returns the correct number of items per page' do
      expect(result.records.size).to eq(2)
    end

    it 'returns the correct items for the page' do
      expect(result.records).to eq(ordered_scope.first(2))
    end

    context 'when a different page is specified' do
      let(:params) { { page: 2, items: 2 } }

      it 'returns the correct items for the page' do
        expect(result.records).to eq([ordered_scope.last])
      end
    end
  end
end
