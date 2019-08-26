require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "John",
        :email => "john@example.org",
        :phone => "503-555-5555"
      ),
      User.create!(
        :name => "Sue",
        :email => "sue@example.org",
        :phone => "503-555-5555"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => /John|Sue/, :count => 2
    assert_select "tr>td", :text => /example.org/, :count => 2
    assert_select "tr>td", :text => "503-555-5555", :count => 2
  end
end
