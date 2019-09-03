require 'rails_helper'

RSpec.describe "claims/show", type: :view do
  before(:each) do
    @claim = assign(:claim, create(:claim))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/true/)
  end
end
