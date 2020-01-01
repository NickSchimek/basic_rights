require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    @user = create(:user)
  end

  it "signs me in" do
    visit user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'asdf1234'
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
  end
end
