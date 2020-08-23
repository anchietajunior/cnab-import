require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe 'GET /home' do
    context "success" do
      it 'is a successfull request' do
        get "/"
        expect(response).to be_successful
        expect(response.body).to include("Import CNAB file")
      end
    end
  end

  describe 'GET /stores' do
    context 'success' do
      let(:file) do
        File.read(Rails.root.join("spec", "support", "cnab.txt"))
      end

      let!(:service) do
        Transactions::Imports::TransactionsService.call(file)
      end

      it 'has a BAR DO JOÃO store included' do
        get "/stores"
        expect(response).to be_successful
        expect(response.body).to include("BAR DO JOÃO")
      end
    end
  end
  
  describe 'GET /stores/:id' do
    context 'success' do
      let(:file) do
        File.read(Rails.root.join("spec", "support", "cnab.txt"))
      end

      let!(:service) do
        Transactions::Imports::TransactionsService.call(file)
      end

      it 'has a JOÃO MACEDO store onwer name included' do
        get "/stores/1"
        expect(response).to be_successful
        expect(response.body).to include("JOÃO MACEDO")
      end
    end
  end
end