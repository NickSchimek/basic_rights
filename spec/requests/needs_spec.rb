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
    let!(:needs) { [create(:need, resource: 'need_one'),
                    create(:need, resource: 'need_two'),
                    create(:need, resource: 'need_three', active: false)] }
    it 'default view lists active needs across all organizations' do
      get needs_path
      expect(response.body).to include('need_one', 'need_two')
    end

    it 'default view does not list inactive needs' do
      get needs_path
      expect(response.body).to_not include('need_three')
    end

    it 'lists active needs with active query set to true' do
      get needs_path, params: { active: true }
      expect(response.body).to include('need_one', 'need_two')
    end

    it 'does not list inactive needs with active query set to true' do
      get needs_path, params: { active: true }
      expect(response.body).to_not include('need_three')
    end

    it 'lists inactive needs with active query set to false' do
      get needs_path, params: { active: false }
      expect(response.body).to include('need_three')
    end

    it 'does not list active needs with active query set to false' do
      get needs_path, params: { active: false }
      expect(response.body).to_not include('need_one', 'need_two')
    end
  end
end
