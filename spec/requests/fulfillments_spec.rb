require 'rails_helper'

RSpec.describe "Fulfillments", type: :request do
  describe "GET needs/fulfillments" do
    let(:need) { create(:need) }
    it "works! (now write some real specs)" do
      get need_fulfillments_path(need)
      expect(response).to have_http_status(200)
    end
  end
end
