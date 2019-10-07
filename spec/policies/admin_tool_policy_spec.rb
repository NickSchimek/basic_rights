require 'rails_helper'
require 'pundit/rspec'

RSpec.describe AdminToolPolicy, type: :policy do
  subject { described_class }

  Role.create(name: 'admin')

  admin_role = Role.find_by(name: 'admin')

  let(:organization) { create(:organization) }

  let(:admin) { create(:user) }
  let(:user) { create(:user, email: 'user_email@example.org') }

  permissions :show? do
    it 'grants access to the site admin' do
      Membership.create(role_id: admin_role.id, user_id: admin.id)
      expect(subject).to permit(admin, organization)
    end

    it 'denies acces to non-admins' do
      expect(subject).to_not permit(user, organization)
    end
  end
end
