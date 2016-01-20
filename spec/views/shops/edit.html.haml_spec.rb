require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :uuid => "MyString",
      :title => "MyString",
      :name => "MyString",
      :sex => 1,
      :tel => "MyString",
      :email => "MyString",
      :creid => "MyString",
      :company => "MyString",
      :login_name => "MyString",
      :login_pass => "MyString",
      :subshop_count => 1,
      :level => 1
    ))
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do

      assert_select "input#shop_uuid[name=?]", "shop[uuid]"

      assert_select "input#shop_title[name=?]", "shop[title]"

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_sex[name=?]", "shop[sex]"

      assert_select "input#shop_tel[name=?]", "shop[tel]"

      assert_select "input#shop_email[name=?]", "shop[email]"

      assert_select "input#shop_creid[name=?]", "shop[creid]"

      assert_select "input#shop_company[name=?]", "shop[company]"

      assert_select "input#shop_login_name[name=?]", "shop[login_name]"

      assert_select "input#shop_login_pass[name=?]", "shop[login_pass]"

      assert_select "input#shop_subshop_count[name=?]", "shop[subshop_count]"

      assert_select "input#shop_level[name=?]", "shop[level]"
    end
  end
end
