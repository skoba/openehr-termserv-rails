require 'rails_helper'

RSpec.describe "Codes API", type: :request do
  before(:all) do
    FactoryBot.create :country_code
  end

  describe "GET /codes" do
    it "works!" do
      get codes_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET code sets from description' do
    it 'gets code sets from description' do
      code_attributes = FactoryBot.attributes_for(:country_code)
      get codes_path, params: { description: code_attributes[:description]}
      expect(response).to have_http_status(:success)
    end

    it 'does not get code from wrong description' do
      get codes_path, params: { description: 'detarame' }
      expect(response).not_to have_http_status(:success)
    end
  end
end
