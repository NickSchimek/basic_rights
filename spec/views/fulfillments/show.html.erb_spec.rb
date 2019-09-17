require 'rails_helper'

RSpec.describe "fulfillments/show", type: :view do
  before(:each) do
    @fulfillment = assign(:fulfillment, create(:fulfillment))
    @need = @fulfillment.need
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/true/)
  end
end
