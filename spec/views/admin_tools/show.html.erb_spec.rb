require 'rails_helper'

RSpec.describe "admin_tools/show.html.erb", type: :view do
  describe 'superuser' do
    before(:each) do
      superuser = create(:user)
      superuser.memberships.create(role: create(:role, name: 'superuser'))
      assign(:organization, build(:organization))
      allow(view).to receive(:current_user).and_return(superuser)
    end

    it 'renders the add user link' do
      render
      expect(rendered).to match(new_user_path)
    end

    it 'renders the organization form' do
      render
      expect(rendered).to match('form action="/organizations"')
    end
  end

  describe 'admin' do
    before(:each) do
      admin = create(:user)
      admin.memberships.create(role: create(:role, name: 'admin'))
      allow(view).to receive(:current_user).and_return(admin)
    end

    it 'renders the add user link' do
      render
      expect(rendered).to match(new_user_path)
    end

    it 'does not render the organization form' do
      render
      expect(rendered).to_not match('form action="/organizations"')
    end
  end
end
