RSpec.describe User, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(null: false) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(default: '', null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: '', null: false) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'db_indexes' do
    it { is_expected.to have_db_index(:email).unique(true) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end

    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
      it { is_expected.to validate_length_of(:password).is_at_most(128) }
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:searches).dependent(:destroy) }
  end
end
