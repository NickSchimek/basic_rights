require 'rails_helper'
require 'pundit/rspec'

RSpec.describe AdminToolPolicy, type: :policy do
  subject { described_class }

  let!(:superuser_role) { Role.create(name: 'superuser') }
  let(:admin_role) { Role.create(name: 'admin') }
  let(:member_role) { Role.create(name: 'member') }

  let(:organization) { create(:organization) }

  let(:superuser) { create(:user) }
  let(:admin) { create(:user, email: 'admin_email@example.org') }
  let(:member) { create(:user, email: 'member_email@example.org') }

  permissions :show? do
    it 'grants access to the superuser' do
      superuser.memberships.create(role_id: superuser_role.id)
      expect(subject).to permit(superuser, organization)
    end

    it 'grants access to the admin' do
      admin.memberships.create(role_id: admin_role.id, organization_id: organization.id)
      expect(subject).to permit(admin, organization)
    end

    it 'denies access to the member' do
      member.memberships.create(role_id: member_role.id, organization_id: organization.id)
      expect(subject).to_not permit(member, organization)
    end
  end
end
