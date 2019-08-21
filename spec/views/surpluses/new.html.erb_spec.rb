require 'rails_helper'

RSpec.describe "surpluses/new", type: :view do
  before(:each) do
    assign(:surpluse, Surpluse.new(
      :resource => "MyString",
      :description => "MyString",
      :quantity => 1,
      :active => false
    ))
  end

  it "renders new surpluse form" do
    render

    assert_select "form[action=?][method=?]", surpluses_path, "post" do

      assert_select "input[name=?]", "surpluse[resource]"

      assert_select "input[name=?]", "surpluse[description]"

      assert_select "input[name=?]", "surpluse[quantity]"

      assert_select "input[name=?]", "surpluse[active]"
    end
  end
end
