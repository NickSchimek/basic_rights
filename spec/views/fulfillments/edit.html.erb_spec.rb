require 'rails_helper'

RSpec.describe "fulfillments/edit", type: :view do
  before(:each) do
    @fulfillment = assign(:fulfillment, create(:fulfillment))
    @need = assign(:need, @fulfillment.need)
    assign(:user, create(:user, :admin))
  end

  it "renders the edit fulfillment form" do
    render

    assert_select "form[action=?][method=?]", need_fulfillment_path(@need, @fulfillment), "post" do

      assert_select "input[name=?]", "fulfillment[quantity]"

      assert_select "input[name=?]", "fulfillment[received]"

      assert_select "input[name=?]", "fulfillment[active]"

      assert_select "input[name=?]", "fulfillment[need]"

      assert_select "input[name=?]", "fulfillment[organization_id]"
    end
  end
end
