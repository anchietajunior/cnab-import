require 'rails_helper'

RSpec.describe Transactions::Imports::TransactionsService do

  context 'seeding transaction types' do
    it 'has 9 transaction types' do
      expect(TransactionType.all.count).to eq(9)
    end
  end

  describe '#call' do
    context 'success' do
      let(:file) do
        File.read(Rails.root.join("spec", "support", "cnab.txt"))
      end

      let(:service) do
        described_class.call(file)
      end

      it 'has a success? true as result' do
        expect(service.success?).to be_truthy
      end

      it 'has 21 created transactions' do
        service
        expect(Transaction.all.count).to eq(21)
      end
    end
  end
end