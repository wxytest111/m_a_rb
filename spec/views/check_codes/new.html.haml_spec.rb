require 'rails_helper'

RSpec.describe "check_codes/new", type: :view do
  before(:each) do
    assign(:check_code, CheckCode.new(
      :code => "MyString",
      :mobile => "MyString"
    ))
  end

  it "renders new check_code form" do
    render

    assert_select "form[action=?][method=?]", check_codes_path, "post" do

      assert_select "input#check_code_code[name=?]", "check_code[code]"

      assert_select "input#check_code_mobile[name=?]", "check_code[mobile]"
    end
  end
end
