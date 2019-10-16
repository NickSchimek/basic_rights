require 'rails_helper'

RSpec.describe Membership, type: :model do
  let!(:superuser_role) { Role.create(name: 'superuser') }
  let!(:admin_role) { Role.create(name: 'admin') }
  let!(:member_role) { Role.create(name: 'member') }

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:role) }
    it { should belong_to(:organization).required(false) }
  end

  describe 'validations' do
    context 'organization' do
      let(:superuser) { create(:user, email: 'superuser@example.org') }
      let(:admin) { create(:user, email: 'admin@example.org') }
      let(:member) { create(:user, email: 'member@example.org') }
      it 'allows superuser to persist without belong to an organization' do
        record = Membership.create(user_id: superuser.id, role_id: superuser_role.id)
        expect(record).to be_valid
      end

      it 'does not allow admin to be valid without an organization' do
        record = Membership.create(user_id: admin.id, role_id: admin_role.id)
        expect(record).to_not be_valid
      end

      it 'does not allow member to be valid without an organization' do
        record = Membership.create(user_id: member.id, role_id: member_role.id)
        expect(record).to_not be_valid
      end
    end
  end
end
