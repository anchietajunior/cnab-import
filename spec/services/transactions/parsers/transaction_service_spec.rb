require 'rails_helper'

RSpec.describe Transactions::Parsers::TransactionService do

  let(:transaction) do
    File.read(Rails.root.join("spec", "support", "cnab.txt")).lines.first
  end

  describe '#call' do
    context 'success' do
      let(:service) do
        described_class.call(transaction)
      end

      it 'is not an empty hash' do
        expect(service.empty?).to be_falsey
      end

      it 'has a Financiamento transaction type' do
        transaction_type = service[:transaction_type]
        expect(transaction_type.description).to eq("Financiamento")
      end
    end

    context 'failure' do
      let(:service) do
        described_class.call("")
      end

      it 'is an empty hash' do
        expect(service).to eq({})
      end
    end
  end

end