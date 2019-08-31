require 'rails_helper'

RSpec.describe "needs/edit", type: :view do
  before(:each) do
    @need = assign(:need, create(:need))
    @organization = assign(:organization, create(:organization))
  end

  it "renders the edit need form" do
    render

    assert_select "form[action=?][method=?]", organization_need_path(@organization, @need), "post" do

      assert_select "input[name=?]", "need[resource]"

      assert_select "input[name=?]", "need[description]"

      assert_select "input[name=?]", "need[quantity]"

      assert_select "input[name=?]", "need[active]"
    end
  end
end
