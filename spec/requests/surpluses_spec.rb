require 'rails_helper'

RSpec.describe "Surpluses", type: :request do
  describe "GET /surpluses" do
    it "works! (now write some real specs)" do
      get surpluses_path
      expect(response).to have_http_status(200)
    end
  end
end
