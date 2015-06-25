require 'rails_helper'

RSpec.describe "streets/edit", type: :view do
  before(:each) do
    @street = assign(:street, Street.create!(
      :name => "MyString",
      :area => nil
    ))
  end

  it "renders the edit street form" do
    render

    assert_select "form[action=?][method=?]", street_path(@street), "post" do

      assert_select "input#street_name[name=?]", "street[name]"

      assert_select "input#street_area_id[name=?]", "street[area_id]"
    end
  end
end
