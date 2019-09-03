require 'rails_helper'

RSpec.describe "Needs", type: :request do
  describe "GET organization/needs" do
    let(:organization) { create(:organization) }
    it "works! (now write some real specs)" do
      get organization_needs_path(organization)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get /needs' do
    let!(:needs) { [create(:need, resource: 'need_one'), create(:need, resource: 'need_two')] }
    it 'lists all needs across all organizations' do
      get needs_path
      expect(response.body).to include('need_one', 'need_two')
    end
  end
end
