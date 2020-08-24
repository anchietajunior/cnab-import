require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:transaction_type) }
    it { should validate_presence_of(:store) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:card) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:traded_at) }
  end

  describe 'relationships' do
    it { should belong_to(:store) }
    it { should belong_to(:transaction_type) }
  end
end
