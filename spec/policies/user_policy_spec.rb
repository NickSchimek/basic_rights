require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class }

  let(:superuser_role) { Role.create(name: 'superuser') }
  let!(:superuser) { create(:user) }

  permissions :show? do
    pending "add some examples to (or delete) #{__FILE__}"
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
  end
end
