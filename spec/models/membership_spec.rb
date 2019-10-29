require 'rails_helper'

RSpec.describe Membership, type: :model do
  let!(:superuser_role) { Role.create(name: 'superuser') }
  let!(:admin_role) { Role.create(name: 'admin') }
  let!(:member_role) { Role.create(name: 'member') }
  let(:superuser) { create(:user, email: 'superuser@example.org') }

  describe 'relationships' do
    subject { Membership.new(user_id: superuser.id, role_id: superuser_role.id) }
    it { should belong_to(:user) }
    it { should belong_to(:role) }
    it { should belong_to(:organization).required(false) }
  end

  describe 'validations' do
    let(:admin) { create(:user, email: 'admin@example.org') }
    let(:member) { create(:user, email: 'member@example.org') }
    let(:organization) { create(:organization) }
    let(:other_organization) { create(:organization, name: 'other') }
    context 'organization' do
      it 'allows superuser to persist without belong to an organization' do
        record = Membership.new(user_id: superuser.id, role_id: superuser_role.id)
        expect(record).to be_valid
      end

      it 'allows superuser to be assigned to an organization' do
        record = Membership.new(user_id: superuser.id, role_id: superuser_role.id, organization_id: organization.id)
        expect(record).to be_valid
      end

      it 'does not allow admin to be valid without an organization' do
        record = Membership.new(user_id: admin.id, role_id: admin_role.id)
        expect(record).to_not be_valid
      end

      it 'does not allow member to be valid without an organization' do
        record = Membership.new(user_id: member.id, role_id: member_role.id)
        expect(record).to_not be_valid
      end

      it 'does not allow admin to also be a member' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: organization.id)
        record = Membership.new(user_id: admin.id, role_id: member_role.id, organization_id: organization.id)
        expect(record).to_not be_valid
      end

      it 'allows superuser to be an admin' do
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        record = Membership.new(user_id: superuser.id, role_id: admin_role.id, organization_id: organization.id)
        expect(record).to be_valid
      end

      it 'allows superuser to be a member' do
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        record = Membership.new(user_id: member.id, role_id: member_role.id, organization_id: organization.id)
        expect(record).to be_valid
      end

      it 'does not allow a user to be a member of another organization' do
        Membership.create(user_id: admin.id, role_id: admin_role.id, organization_id: organization.id)
        record = Membership.new(user_id: admin.id, role_id: member_role.id, organization_id: other_organization.id)
        expect(record).to_not be_valid
      end
    end
    context 'unique rows' do
      it 'for user and role combination' do
        Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        record = Membership.new(user_id: superuser.id, role_id: superuser_role.id)
        expect(record).to_not be_valid
      end
    end
  end
end
