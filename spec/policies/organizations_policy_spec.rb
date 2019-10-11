require 'rails_helper'
require 'pundit/rspec'

describe OrganizationPolicy do
  subject { described_class }

  Role.create(name: 'superuser')

  superuser_role = Role.find_by(name: 'superuser')

  let(:organization) { create(:organization) }

  let!(:superuser) { create(:user) }
  let(:user) { create(:user, email: 'user_email@example.org') }

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it 'grants access to the superuser' do
      Membership.create(role_id: superuser_role.id, user_id: superuser.id)
      expect(subject).to permit(superuser, organization)
    end

    it 'denies acces when not a superuser' do
      expect(subject).to_not permit(user, organization)
    end
  end
end
