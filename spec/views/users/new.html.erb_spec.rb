require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, build(:user))
  end

  context "superuser" do
    it "renders new user form" do
      super_user = create(:user, email: 'superuser@email.org')
      super_user.memberships.create role: create(:role, name: 'superuser')
      allow(view).to receive(:current_user).and_return(super_user)

      render

      assert_select "form[action=?][method=?]", users_path, "post" do

        assert_select "input[name=?]", "user[name]"

        assert_select "input[name=?]", "user[email]"

        assert_select "input[name=?]", "user[password]"

        assert_select "select[name=?]", "organization[id]"

        assert_select "input[type=?]", "radio"
        assert_select "input[id=?]", "role_name_superuser"
        assert_select "input[id=?]", "role_name_admin"
        assert_select "input[id=?]", "role_name_member"
      end
    end
  end

  context "admin" do
    it "renders new user form" do
      admin_user = create(:user, email: 'adminuser@email.org')
      admin_user.memberships.create role: create(:role, name: 'adminuser')
      allow(view).to receive(:current_user).and_return(admin_user)

      render

      assert_select "form[action=?][method=?]", users_path, "post" do

        assert_select "input[name=?]", "user[name]"

        assert_select "input[name=?]", "user[email]"

        assert_select "input[name=?]", "user[password]"

        assert_select "select[name=?]", "organization[id]", false

        assert_select "input[type=?]", "radio"
        assert_select "input[id=?]", "role_name_superuser", false
        assert_select "input[id=?]", "role_name_admin"
        assert_select "input[id=?]", "role_name_member"
      end
    end
  end
end
