require 'rails_helper'

RSpec.describe "Surplus", type: :request do
  describe "GET organization/surplus" do
    let!(:organization) { create(:organization) }
    it "works! (now write some real specs)" do
      get organization_surplus_path(organization)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /surplus" do
    let!(:surplus) { [create(:surplus, resource: 'surplus_one'), create(:surplus, resource: 'surplus_two')] }
    it "lists all organizations surplus" do
      get surplus_path
      expect(response.body).to include('surplus_one', 'surplus_two')
    end
  end
end
