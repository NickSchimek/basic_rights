require 'rails_helper'

RSpec.describe "surpluses/edit", type: :view do
  before(:each) do
    @surpluse = assign(:surpluse, Surpluse.create!(
      :resource => "MyString",
      :description => "MyString",
      :quantity => 1,
      :active => false
    ))
  end

  it "renders the edit surpluse form" do
    render

    assert_select "form[action=?][method=?]", surpluse_path(@surpluse), "post" do

      assert_select "input[name=?]", "surpluse[resource]"

      assert_select "input[name=?]", "surpluse[description]"

      assert_select "input[name=?]", "surpluse[quantity]"

      assert_select "input[name=?]", "surpluse[active]"
    end
  end
end
