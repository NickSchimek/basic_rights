require 'rails_helper'

RSpec.describe "fulfillments/drop_off", type: :view do
  before(:each) do
    assign(:fulfillment, build(:fulfillment))
    @need = assign(:need, create(:need))
  end

  it "renders drop_off fulfillment form" do
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
