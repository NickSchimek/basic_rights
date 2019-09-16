require 'rails_helper'

RSpec.describe "fulfillments/index", type: :view do
  before(:each) do
    assign(:fulfillments, [
      Fulfillment.create!(
        :quantity => "",
        :received => "",
        :active => "",
        :need => "",
        :organization => nil
      ),
      Fulfillment.create!(
        :quantity => "",
        :received => "",
        :active => "",
        :need => "",
        :organization => nil
      )
    ])
  end

  it "renders a list of fulfillments" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
