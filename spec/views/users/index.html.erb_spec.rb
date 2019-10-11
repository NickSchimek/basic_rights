require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [create(:user), create(:user, email: 'sue@example.org')])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => /Guest/, :count => 2
    assert_select "tr>td", :text => /example.org/, :count => 2
  end
end
