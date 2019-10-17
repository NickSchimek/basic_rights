require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:superuser_role) { Role.create name: 'superuser' }
  let!(:admin_role) { Role.create name: 'admin' }
  let(:info_211) { create(:organization, name: '211 info') }
  describe "GET /users" do
    it "redirects when not authorized" do
      get users_path
      expect(response).to have_http_status(302)
    end

    it "is success when superuser" do
      superuser = create(:user, email: 'superuser@example.org')
      Membership.create(user_id: superuser.id, role_id: superuser_role.id)
      sign_in superuser
      get users_path
      expect(response).to have_http_status(200)
    end

    it "redirects when admin" do
      admin = create(:user, email: 'admin@example.org')
      Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: info_211.id)
      sign_in admin
      get users_path
      expect(response).to have_http_status(302)
    end
  end
end
