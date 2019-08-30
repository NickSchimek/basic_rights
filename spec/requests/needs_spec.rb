require 'rails_helper'

RSpec.describe "Needs", type: :request do
  describe "GET organization/needs" do
    let(:organization) { create(:organization) }
    it "works! (now write some real specs)" do
      get organization_needs_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
