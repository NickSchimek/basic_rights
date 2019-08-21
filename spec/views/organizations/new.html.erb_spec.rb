require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyString",
      :contact => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input[name=?]", "organization[name]"

      assert_select "input[name=?]", "organization[contact]"

      assert_select "input[name=?]", "organization[email]"

      assert_select "input[name=?]", "organization[phone]"
    end
  end
end
