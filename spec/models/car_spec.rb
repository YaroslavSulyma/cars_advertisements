RSpec.describe Car, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(null: false) }
    it { is_expected.to have_db_column(:make).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:model).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:year).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:odometer).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:price).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'db_indexes' do
    it { is_expected.to have_db_index(:make) }
    it { is_expected.to have_db_index(:model) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:make) }
      it { is_expected.to validate_presence_of(:model) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:year) }
      it { is_expected.to validate_presence_of(:odometer) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:odometer).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:make).is_at_most(70) }
      it { is_expected.to validate_length_of(:model).is_at_most(70) }
      it { is_expected.to validate_length_of(:description).is_at_most(400) }
    end

    context 'inclusion' do
      it { is_expected.to validate_inclusion_of(:year).in_range(1884..Date.current.year) }
    end
  end
end
