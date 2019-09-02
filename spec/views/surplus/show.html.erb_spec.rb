require 'rails_helper'

RSpec.describe "surplus/show", type: :view do
  before(:each) do
    @surplus = assign(:surplus, create(:surplus))
    assign(:organization, create(:organization))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Resource/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/true/)
  end
end
