require 'rails_helper'

RSpec.describe "beauticians/edit", type: :view do
  before(:each) do
    @beautician = assign(:beautician, Beautician.create!(
      :name => "MyString",
      :mobile => "MyString",
      :id => "MyString"
    ))
  end

  it "renders the edit beautician form" do
    render

    assert_select "form[action=?][method=?]", beautician_path(@beautician), "post" do

      assert_select "input#beautician_name[name=?]", "beautician[name]"

      assert_select "input#beautician_mobile[name=?]", "beautician[mobile]"

      assert_select "input#beautician_id[name=?]", "beautician[id]"
    end
  end
end
