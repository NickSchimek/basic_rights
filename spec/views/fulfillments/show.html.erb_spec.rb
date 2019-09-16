require 'rails_helper'

RSpec.describe "fulfillments/show", type: :view do
  before(:each) do
    @fulfillment = assign(:fulfillment, Fulfillment.create!(
      :quantity => "",
      :received => "",
      :active => "",
      :need => "",
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
