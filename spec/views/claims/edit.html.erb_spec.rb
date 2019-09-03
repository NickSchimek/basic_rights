require 'rails_helper'

RSpec.describe "claims/edit", type: :view do
  before(:each) do
    @claim = assign(:claim, create(:claim))
  end

  it "renders the edit claim form" do
    render

    assert_select "form[action=?][method=?]", claim_path(@claim), "post" do

      assert_select "input[name=?]", "claim[quantity]"

      assert_select "input[name=?]", "claim[picked_up]"

      assert_select "input[name=?]", "claim[active]"

      assert_select "input[name=?]", "claim[surplu]"

      assert_select "input[name=?]", "claim[organization_id]"
    end
  end
end
