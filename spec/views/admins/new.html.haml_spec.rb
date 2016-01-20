require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      :username => "MyString",
      :passwd => "MyString",
      :type => 1
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input#admin_username[name=?]", "admin[username]"

      assert_select "input#admin_passwd[name=?]", "admin[passwd]"

      assert_select "input#admin_type[name=?]", "admin[type]"
    end
  end
end
