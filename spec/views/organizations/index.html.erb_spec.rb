 require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        :name => "Name",
        :contact => "Contact",
        :email => "Email",
        :phone => "Phone"
      ),
      Organization.create!(
        :name => "Name",
        :contact => "Contact",
        :email => "Email",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "h2", :text => "Name".to_s, :count => 2
    assert_select "div", :text => "Contact".to_s, :count => 2
    assert_select "div", :text => "Email".to_s, :count => 2
    assert_select "div", :text => "Phone".to_s, :count => 2
  end
end
