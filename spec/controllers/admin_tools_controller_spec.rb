require 'rails_helper'

RSpec.describe AdminToolsController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #show" do
    it "returns http success" do
      allow(controller).to receive(:authorize).and_return(true)
      get :show
      expect(response).to have_http_status(:success)
    end

    it "redirects for non-admin user" do
      allow(controller).to receive(:current_user).and_return(user)
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end

end
