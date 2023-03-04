RSpec.shared_examples 'paginatable' do |model_name, default_order_attribute, default_direction|
  subject(:result) { described_class.new(initial_scope).call(params) }

  let(:factory_name) { model_name.downcase.to_sym }
  let(:model_class) { model_name.constantize }

  let!(:first_item) { FactoryBot.create(factory_name) }
  let!(:second_item) { FactoryBot.create(factory_name) }
  let!(:third_item) { FactoryBot.create(factory_name) }

  let(:initial_scope) do
    ids = [first_item.id, second_item.id, third_item.id]
    model_class.where(id: ids)
  end

  let(:ordered_scope) { initial_scope.order(default_order_attribute.to_sym => default_direction) }

  let(:params) { { page: 1, items: 2 } }

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
