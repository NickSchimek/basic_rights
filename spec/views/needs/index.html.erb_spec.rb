require 'rails_helper'

RSpec.describe "needs/index", type: :view do
  before(:each) do
    @needs = assign(:needs, create_list(:need, 2))
    @needs[1].organization = @needs[0].organization
    assign(:organization, @needs[0].organization)
  end

  it "renders an organizations list of needs" do
    render
    assert_select "tr>td", :text => "Resource", :count => 2
    assert_select "tr>td", :text => "Description", :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
