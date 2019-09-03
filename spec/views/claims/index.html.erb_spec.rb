require 'rails_helper'

RSpec.describe "claims/index", type: :view do
  before(:each) do
    assign(:claims, [
      Claim.create!(
        :quantity => "",
        :picked_up => "",
        :active => "",
        :surplu => "",
        :organization => nil
      ),
      Claim.create!(
        :quantity => "",
        :picked_up => "",
        :active => "",
        :surplu => "",
        :organization => nil
      )
    ])
  end

  it "renders a list of claims" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
