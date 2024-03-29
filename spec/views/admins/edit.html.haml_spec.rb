require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      :username => "MyString",
      :passwd => "MyString",
      :type => 1
    ))
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do

      assert_select "input#admin_username[name=?]", "admin[username]"

      assert_select "input#admin_passwd[name=?]", "admin[passwd]"

      assert_select "input#admin_type[name=?]", "admin[type]"
    end
  end
end
