require 'rails_helper'

RSpec.describe "surpluses/index", type: :view do
  before(:each) do
    assign(:surpluses, [
      Surpluse.create!(
        :resource => "Resource",
        :description => "Description",
        :quantity => 2,
        :active => false
      ),
      Surpluse.create!(
        :resource => "Resource",
        :description => "Description",
        :quantity => 2,
        :active => false
      )
    ])
  end

  it "renders a list of surpluses" do
    render
    assert_select "tr>td", :text => "Resource".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
