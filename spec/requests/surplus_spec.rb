require 'rails_helper'

RSpec.describe "Surplus", type: :request do
  describe "GET /surplus" do
    it "works! (now write some real specs)" do
      get surplus_path
      expect(response).to have_http_status(200)
    end
  end
end
