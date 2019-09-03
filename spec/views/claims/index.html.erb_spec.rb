require 'rails_helper'

RSpec.describe "claims/index", type: :view do
  before(:each) do
    assign(:claims, create_list(:claim, 2))
  end

  it "renders a list of claims" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
