require 'rails_helper'

RSpec.describe "needs/index", type: :view do
  before(:each) do
    assign(:needs, [
      Need.create!(
        :resource => "Resource",
        :description => "Description",
        :quantity => 2,
        :active => false
      ),
      Need.create!(
        :resource => "Resource",
        :description => "Description",
        :quantity => 2,
        :active => false
      )
    ])
  end

  it "renders a list of needs" do
    render
    assert_select "tr>td", :text => "Resource".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
