require 'rails_helper'
include AuthHelper

describe "partial fulfillment view", type: :feature do

  before :each do
    organization = create(:organization)
    @user        = create(:user)
    @need        = create(:need, organization: organization)

    sign_in(@user)
  end

  it "loads partial fulfillment view" do
    visit edit_need_path(@need)
    click_link('Add Partial Fulfillment')
    expect(page).to have_current_path(new_need_fulfillment_path(@need))
  end
end
