require 'rails_helper'

RSpec.describe "check_codes/edit", type: :view do
  before(:each) do
    @check_code = assign(:check_code, CheckCode.create!(
      :code => "MyString",
      :mobile => "MyString"
    ))
  end

  it "renders the edit check_code form" do
    render

    assert_select "form[action=?][method=?]", check_code_path(@check_code), "post" do

      assert_select "input#check_code_code[name=?]", "check_code[code]"

      assert_select "input#check_code_mobile[name=?]", "check_code[mobile]"
    end
  end
end
