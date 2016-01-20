require 'rails_helper'

RSpec.describe "districts/new", type: :view do
  before(:each) do
    assign(:district, District.new(
      :name => "MyString",
      :city => nil
    ))
  end

  it "renders new district form" do
    render

    assert_select "form[action=?][method=?]", districts_path, "post" do

      assert_select "input#district_name[name=?]", "district[name]"

      assert_select "input#district_city_id[name=?]", "district[city_id]"
    end
  end
end
