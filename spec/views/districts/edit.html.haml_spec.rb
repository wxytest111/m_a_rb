require 'rails_helper'

RSpec.describe "districts/edit", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :name => "MyString",
      :city => nil
    ))
  end

  it "renders the edit district form" do
    render

    assert_select "form[action=?][method=?]", district_path(@district), "post" do

      assert_select "input#district_name[name=?]", "district[name]"

      assert_select "input#district_city_id[name=?]", "district[city_id]"
    end
  end
end
