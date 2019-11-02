require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @superuser = create(:role, name: 'superuser')
    @member = create(:role, name: 'member')
    @user = assign(:user, create(:user))
  end

  it "renders attributes in <p>" do
    @user.memberships.create role: @member, organization: create(:organization)
    render
    expect(rendered).to match(/Guest/)
    expect(rendered).to match(/guest@example.org/)
    expect(rendered).to match(/211info/)
    expect(rendered).to match(/Member/)
  end

  it "renders without error when organization is missing" do
    @user.memberships.create role: @superuser
    render
    expect(rendered).to match(/Guest/)
    expect(rendered).to match(/guest@example.org/)
    expect(rendered).to match(/Superuser/)
  end
end
