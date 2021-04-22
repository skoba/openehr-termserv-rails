require 'rails_helper'

RSpec.describe CodesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'provides @codes' do
      codes = FactoryBot.create :country_code
      get :index
      expect(assigns(:codes)).to include codes
    end

    it 'provides @code matched with parameters' do
      code = FactoryBot.create :country_code
      get :index, params: { description: code.description }
      expect(assigns(:codes)).to eq [code]
    end
  end

  describe "GET #show" do
    it "returns http success" do
      code = create :country_code
      get :show, params: {id: code}
      expect(response).to have_http_status(:success)
    end
  end
end
