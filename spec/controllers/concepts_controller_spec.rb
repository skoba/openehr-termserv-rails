require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      concept = create :concept
      get :show, params: { id: concept }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders idnex template' do
      get :index
      expect(response).to render_template :index
    end

    it 'provides @groups' do
      create :terminology
      get :index
      expect(assigns(:terminologies)).not_to be_nil
    end
  end

end
