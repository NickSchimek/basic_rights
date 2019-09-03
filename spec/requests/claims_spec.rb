require 'rails_helper'

RSpec.describe "Claims", type: :request do
  describe "GET /claims" do
    it "works! (now write some real specs)" do
      get claims_path
      expect(response).to have_http_status(200)
    end
  end
end
