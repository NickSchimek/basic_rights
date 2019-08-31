require 'rails_helper'

RSpec.describe "needs/new", type: :view do
  before(:each) do
    assign(:need, build(:need))
    @organization = assign(:organization, create(:organization))
  end

  it "renders new need form" do
    render

    assert_select "form[action=?][method=?]", organization_needs_path(@organization), "post" do

      assert_select "input[name=?]", "need[resource]"

      assert_select "input[name=?]", "need[description]"

      assert_select "input[name=?]", "need[quantity]"

      assert_select "input[name=?]", "need[active]"
    end
  end
end
