require 'rails_helper'

RSpec.describe "surplus/edit", type: :view do
  before(:each) do
    @surplus = assign(:surplus, create(:surplus))
    @organization = assign(:organization, create(:organization))
  end

  it "renders the edit surplus form" do
    render

    assert_select "form[action=?][method=?]", "/surplus/#{@surplus.id}", "post" do

      assert_select "input[name=?]", "surplu[resource]"

      assert_select "input[name=?]", "surplu[description]"

      assert_select "input[name=?]", "surplu[quantity]"

      assert_select "input[name=?]", "surplu[active]"
    end
  end
end
