require 'rails_helper'

RSpec.describe Stores::Balances::TotalService do

  let(:file) do
    File.read(Rails.root.join("spec", "support", "cnab.txt"))
  end

  let!(:import_transactions) do
    Transactions::Imports::TransactionsService.call(file)
  end

  let(:first_store_service) do
    described_class.call(Store.first.id)
  end
  
  let(:last_store_service) do
    described_class.call(Store.last.id)
  end

  describe '#call' do
    context 'success' do
      it 'is -102.0' do
        expect(first_store_service.value).to eq(-102.0)
      end

      it 'is -192.0' do
        expect(last_store_service.value).to eq(-192.0)
      end
    end
  end

end