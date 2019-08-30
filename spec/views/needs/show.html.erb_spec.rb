require 'rails_helper'

RSpec.describe "needs/show", type: :view do
  before(:each) do
    assign(:need, create(:need))
    assign(:organization, create(:organization))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Resource/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/true/)
  end
end
