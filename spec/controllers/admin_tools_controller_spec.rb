require 'rails_helper'

RSpec.describe AdminToolsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      allow(controller).to receive(:authorize).and_return(true)
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
