require 'rails_helper'

RSpec.describe Store, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner_name) }
  end

  describe 'relationships' do
    it { should have_many(:transactions) }
  end

  describe 'total_balance' do
    let!(:store) { create(:store) }
    let!(:transaction) { create(:transaction, store: store) }

    it 'has 100.0 as total balance' do
      expect(store.total_balance).to eq(100.0)
    end
  end
end
