require 'rails_helper'

RSpec.describe "beauticians/new", type: :view do
  before(:each) do
    assign(:beautician, Beautician.new(
      :name => "MyString",
      :mobile => "MyString",
      :id => "MyString"
    ))
  end

  it "renders new beautician form" do
    render

    assert_select "form[action=?][method=?]", beauticians_path, "post" do

      assert_select "input#beautician_name[name=?]", "beautician[name]"

      assert_select "input#beautician_mobile[name=?]", "beautician[mobile]"

      assert_select "input#beautician_id[name=?]", "beautician[id]"
    end
  end
end
