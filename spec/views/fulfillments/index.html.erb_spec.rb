require 'rails_helper'

RSpec.describe "fulfillments/index", type: :view do
  before(:each) do
    assign(:fulfillments, create_list(:fulfillment, 2))
    assign(:need, create(:need))
  end

  it "renders a list of fulfillments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
