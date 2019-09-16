require 'rails_helper'

RSpec.describe "fulfillments/edit", type: :view do
  before(:each) do
    @fulfillment = assign(:fulfillment, create(:fulfillment))
  end

  it "renders the edit fulfillment form" do
    render

    assert_select "form[action=?][method=?]", fulfillment_path(@fulfillment), "post" do

      assert_select "input[name=?]", "fulfillment[quantity]"

      assert_select "input[name=?]", "fulfillment[received]"

      assert_select "input[name=?]", "fulfillment[active]"

      assert_select "input[name=?]", "fulfillment[need]"

      assert_select "input[name=?]", "fulfillment[organization_id]"
    end
  end
end
