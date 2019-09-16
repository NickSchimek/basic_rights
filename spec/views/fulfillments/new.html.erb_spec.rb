require 'rails_helper'

RSpec.describe "fulfillments/new", type: :view do
  before(:each) do
    assign(:fulfillment, build(:fulfillment))
  end

  it "renders new fulfillment form" do
    render

    assert_select "form[action=?][method=?]", fulfillments_path, "post" do

      assert_select "input[name=?]", "fulfillment[quantity]"

      assert_select "input[name=?]", "fulfillment[received]"

      assert_select "input[name=?]", "fulfillment[active]"

      assert_select "input[name=?]", "fulfillment[need]"

      assert_select "input[name=?]", "fulfillment[organization_id]"
    end
  end
end
