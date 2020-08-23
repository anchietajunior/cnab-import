require 'rails_helper'

RSpec.describe "Imports", type: :request do
  describe 'POST /import_file' do
    context "success" do
      
      let(:file) do
        Rails.root.join("spec", "support", "cnab.txt")
      end

      it 'is a successfull request' do
        post "/import_file", params: { cnab_file: file }
        expect(response).to redirect_to(stores_url)
      end
    end
  end
end