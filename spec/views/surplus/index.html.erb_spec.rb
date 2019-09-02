require 'rails_helper'

RSpec.describe "surplus/index", type: :view do
  before(:each) do
    assign(:surplus, create_list(:surplus, 2))
    assign(:organization, create(:organization))
  end

  it "renders a list of surplus" do
    render
    assert_select "tr>td", :text => "resource".to_s, :count => 2
    assert_select "tr>td", :text => "description".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
