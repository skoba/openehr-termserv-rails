require 'rails_helper'

RSpec.describe CodesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      code = create :country_code
      get :show, id: code
      expect(response).to have_http_status(:success)
    end
  end

end
