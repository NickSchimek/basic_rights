require 'rails_helper'

RSpec.describe "claims/show", type: :view do
  before(:each) do
    @claim = assign(:claim, Claim.create!(
      :quantity => "",
      :picked_up => "",
      :active => "",
      :surplu => "",
      :organization => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
