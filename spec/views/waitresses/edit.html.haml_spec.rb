require 'rails_helper'

RSpec.describe "waitresses/edit", type: :view do
  before(:each) do
    @waitress = assign(:waitress, Waitress.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit waitress form" do
    render

    assert_select "form[action=?][method=?]", waitress_path(@waitress), "post" do

      assert_select "input#waitress_name[name=?]", "waitress[name]"

      assert_select "textarea#waitress_description[name=?]", "waitress[description]"
    end
  end
end
