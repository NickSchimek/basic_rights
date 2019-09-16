require 'rails_helper'

RSpec.describe "Fulfillments", type: :request do
  describe "GET /fulfillments" do
    it "works! (now write some real specs)" do
      get fulfillments_path
      expect(response).to have_http_status(200)
    end
  end
end
