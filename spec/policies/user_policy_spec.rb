require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class }

  let!(:superuser_role) { Role.create(name: 'superuser') }
  let(:admin_role) { Role.create(name: 'admin') }
  let(:member_role) { Role.create(name: 'member') }

  let(:info_211) { Organization.create(name: '211_info') }
  let(:jones_org)  {Organization.create(name: 'jones_org') }

  let(:superuser) { create(:user, email: 'superuser@example.org') }
  let(:admin) { create(:user, email: 'admin@example.org') }
  let(:member) { create(:user, email: 'member@example.org') }

  permissions :index? do
    it 'grants access to the superuser' do
      Membership.create!(role_id: superuser_role.id, user_id: superuser.id)
      expect(subject).to permit(superuser)
    end

    it 'denies access to the admin' do
      Membership.create!(role_id: admin_role.id, user_id: admin.id, organization_id: info_211.id)
      expect(subject).to_not permit(admin)
    end

    it 'denies access to member' do
      Membership.create!(role_id: member_role.id, user_id: member.id, organization_id: info_211.id)
      expect(subject).to_not permit(member)
    end
  end

  permissions :show? do
    it 'grants access to your own show page' do
      user = User.find(member.id)
      expect(subject).to permit(member, user)
    end

    it 'grants access to other users show page' do
      user = User.find(admin.id)
      expect(subject).to permit(member, user)
    end

    it 'grants access to the superuser' do
      Membership.create!(role_id: superuser_role.id, user_id: superuser.id)
      expect(subject).to permit(superuser)
    end
  end

  permissions :new?, :create? do
    it 'grants access to the superuser' do
      Membership.create!(role_id: superuser_role.id, user_id: superuser.id)
      expect(subject).to permit(superuser)
    end

    it 'grants access to the admin' do
      Membership.create!(role_id: admin_role.id, user_id: admin.id, organization_id: info_211.id)
      expect(subject).to permit(admin)
    end

    it 'denies access to the member' do
      expect(subject).to_not permit(member)
    end
  end

  permissions :destroy? do
    it 'grants access to the superuser' do
      Membership.create!(role_id: superuser_role.id, user_id: superuser.id)
      expect(subject).to permit(superuser)
    end

    context 'admin' do
      it 'grants access within their organization' do
        Membership.create!(role_id: admin_role.id, user_id: admin.id, organization_id: info_211.id)
        Membership.create!(role_id: member_role.id, user_id: member.id, organization_id: info_211.id)
        expect(subject).to permit(admin, member)
      end

      it 'denies access outside of the organization' do
        Membership.create!(role_id: admin_role.id, user_id: admin.id, organization_id: info_211.id)
        Membership.create!(role_id: member_role.id, user_id: member.id, organization_id: jones_org.id)
        expect(subject).to_not permit(admin, member)
      end
    end

    it 'denies access to the member' do
      Membership.create!(role_id: member_role.id, user_id: member.id, organization_id: info_211.id)
      expect(subject).to_not permit(member, member)
    end
  end
end
