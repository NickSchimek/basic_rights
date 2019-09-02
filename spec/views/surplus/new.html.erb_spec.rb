require 'rails_helper'

RSpec.describe "surplus/new", type: :view do
  before(:each) do
    assign(:surplus, build(:surplus))
    @organization = assign(:organization, create(:organization))
  end

  it "renders new surplus form" do
    render

    assert_select "form[action=?][method=?]", organization_surplus_path(@organization), "post" do

      assert_select "input[name=?]", "surplu[resource]"

      assert_select "input[name=?]", "surplu[description]"

      assert_select "input[name=?]", "surplu[quantity]"

      assert_select "input[name=?]", "surplu[active]"
    end
  end
end
