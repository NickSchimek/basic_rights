require 'rails_helper'

RSpec.describe "fulfillments/new", type: :view do
  before(:each) do
    @need = assign(:need, create(:need))
    assign(:fulfillment, build(:fulfillment, need: @need))
    assign(:user, create(:user, :admin))
  end

  it "renders new fulfillment form" do
    render

    assert_select "form[action=?][method=?]", need_fulfillments_path(@need), "post" do

      assert_select "input[name=?]", "fulfillment[quantity]"

      assert_select "input[name=?]", "fulfillment[received]"

      assert_select "input[name=?]", "fulfillment[active]"

      assert_select "input[name=?]", "fulfillment[need]"

      assert_select "input[name=?]", "fulfillment[organization_id]"
    end
  end
end
