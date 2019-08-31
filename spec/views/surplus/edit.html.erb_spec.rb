require 'rails_helper'

RSpec.describe "surplus/edit", type: :view do
  before(:each) do
    @surplus = assign(:surplus, Surplu.create!(
      :resource => "MyString",
      :description => "MyString",
      :quantity => 1,
      :active => false
    ))
  end

  it "renders the edit surplus form" do
    render

    assert_select "form[action=?][method=?]", surplu_path(@surplus), "post" do

      assert_select "input[name=?]", "surplu[resource]"

      assert_select "input[name=?]", "surplu[description]"

      assert_select "input[name=?]", "surplu[quantity]"

      assert_select "input[name=?]", "surplu[active]"
    end
  end
end
