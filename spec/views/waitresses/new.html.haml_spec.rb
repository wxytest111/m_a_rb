require 'rails_helper'

RSpec.describe "waitresses/new", type: :view do
  before(:each) do
    assign(:waitress, Waitress.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new waitress form" do
    render

    assert_select "form[action=?][method=?]", waitresses_path, "post" do

      assert_select "input#waitress_name[name=?]", "waitress[name]"

      assert_select "textarea#waitress_description[name=?]", "waitress[description]"
    end
  end
end
