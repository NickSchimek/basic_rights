require 'rails_helper'

RSpec.describe "Claims", type: :request do
  describe "GET surplus/claims" do
    let(:surplus) { create(:surplus) }
    it "works! (now write some real specs)" do
      get surplu_claims_path(surplus)
      expect(response).to have_http_status(200)
    end
  end

  describe "Get organization/claims" do
    let(:organization) { create(:organization) }
    it "retrieves list of claims for an organization" do
      get organization_claims_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
