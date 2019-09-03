require 'rails_helper'

RSpec.describe "claims/new", type: :view do
  before(:each) do
    assign(:claim, Claim.new(
      :quantity => "",
      :picked_up => "",
      :active => "",
      :surplu => "",
      :organization => nil
    ))
  end

  it "renders new claim form" do
    render

    assert_select "form[action=?][method=?]", claims_path, "post" do

      assert_select "input[name=?]", "claim[quantity]"

      assert_select "input[name=?]", "claim[picked_up]"

      assert_select "input[name=?]", "claim[active]"

      assert_select "input[name=?]", "claim[surplu]"

      assert_select "input[name=?]", "claim[organization_id]"
    end
  end
end
