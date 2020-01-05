require 'rails_helper'
include AuthHelper

describe "new drop off view", type: :feature do

  before :each do
    organization = create(:organization)
    @user        = create(:user)
    @need        = create(:need, organization: organization)

    sign_in(@user)
  end

  it "renders" do
    visit edit_need_path(@need)
    click_link('Add Partial Fulfillment')
    expect(page).to have_current_path(drop_off_new_need_fulfillment_path(@need))
  end

  it "renders the previous page when the user clicks cancel" do
    visit drop_off_new_need_fulfillment_path(@need)
    click_link('Cancel')
    expect(page).to have_current_path(edit_need_path(@need))
  end
end
