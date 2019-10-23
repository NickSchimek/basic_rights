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
    let!(:surplus) { [create(:surplus, resource: 'surplus_one'),
                      create(:surplus, resource: 'surplus_two'),
                      create(:surplus, resource: 'surplus_three', active: false)] }
    it "default view lists active surplus across all organizations" do
      get surplus_path
      expect(response.body).to include('surplus_one', 'surplus_two')
    end

    it 'default view does not list inactive surplus' do
      get surplus_path
      expect(response.body).to_not include('surplus_three')
    end

    it 'lists active surplus with active query set to true' do
      get surplus_path, params: { active: true }
      expect(response.body).to include('surplus_one', 'surplus_two')
    end

    it 'does not list inactive surplus with active query set to true' do
      get surplus_path, params: { active: true }
      expect(response.body).to_not include('surplus_three')
    end

    it 'lists inactive surplus with active query set to false' do
      get surplus_path, params: { active: false }
      expect(response.body).to include('surplus_three')
    end

    it 'does not list active surplus with active query set to false' do
      get surplus_path, params: { active: false }
      expect(response.body).to_not include('surplus_one', 'surplus_two')
    end
  end
end
