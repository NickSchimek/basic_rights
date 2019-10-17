require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:superuser_role) { Role.create(name: 'superuser') }
  let(:admin_role) { Role.create!(name: 'admin') }
  let(:member_role) { Role.create!(name: 'member') }

  let(:superuser) { create(:user, email: 'superuser@example.org') }
  let(:admin) { create(:user, email: 'admin@example.org') }
  let(:member) { create(:user, email: 'member@example.org') }
  let(:user) { create(:user, email: 'user@example.org') }

  let(:info_211) { create(:organization, name: '211 info') }
  let(:jones_org) { create(:organization, name: 'jones org') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'relationships' do
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:roles).through(:memberships) }
    it { should have_many(:organizations).through(:memberships) }
  end

  describe 'user roles' do
    describe '#superuser?' do
      it 'returns truthy when user is superuser' do
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        expect(superuser).to be_superuser
      end

      it 'returns falsey when user is not an superuser' do
        expect(admin).to_not be_superuser
      end
    end

    describe '#admin?' do
      it 'returns truthy when user is admin' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: info_211.id)
        expect(admin).to be_admin
      end

      it 'returns falsey when user is not an admin' do
        expect(user).to_not be_admin
      end
    end

    describe '#admin_for?' do
      it 'returns truthy when user admin belongs to same organization as user' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: info_211.id)
        Membership.create(user_id: user.id, role_id: member_role.id, organization_id: info_211.id)
        expect(admin).to be_admin_for user
      end

      it 'returns falsey when admin is not in the same organization as the user' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: info_211.id)
        Membership.create(user_id: user.id, role_id: member_role.id, organization_id: jones_org.id)
        expect(admin).to_not be_admin_for user
      end

      it 'returns falsey when user is not a member of an organization' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: info_211.id)
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        expect(admin).to_not be_admin_for superuser
      end

      it 'returns falsey when user does not belong to an organization' do
        Membership.create(user_id: user.id, role_id: member_role.id)
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        expect(user).to_not be_admin_for superuser
      end
    end
  end

  describe '#organization' do
    it 'returns a users organization' do
      Membership.create(user_id: member.id, role_id: member_role.id, organization_id: info_211.id)
      expect(member.organization).to eq(info_211)
    end
  end
end
