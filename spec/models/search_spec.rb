RSpec.describe Search, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:make).of_type(:string) }
    it { is_expected.to have_db_column(:model).of_type(:string) }
    it { is_expected.to have_db_column(:year_from).of_type(:integer) }
    it { is_expected.to have_db_column(:year_to).of_type(:integer) }
    it { is_expected.to have_db_column(:price_from).of_type(:integer) }
    it { is_expected.to have_db_column(:price_to).of_type(:integer) }
    it { is_expected.to have_db_column(:requests_quantity).of_type(:integer).with_options(default: 1, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'db_indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:requests_quantity) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:requests_quantity).is_greater_than_or_equal_to(1) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
  end
end
