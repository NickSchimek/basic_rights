require 'rails_helper'

RSpec.describe "surplus/show", type: :view do
  before(:each) do
    @surplus = assign(:surplus, Surplu.create!(
      :resource => "Resource",
      :description => "Description",
      :quantity => 2,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Resource/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
