require 'rails_helper'

RSpec.describe "apply_shops/new", type: :view do
  before(:each) do
    assign(:apply_shop, ApplyShop.new(
      :name => "MyString",
      :sex => 1,
      :tel => "MyString",
      :email => "MyString",
      :creid => "MyString",
      :company => "MyString",
      :shop => nil,
      :state => 1
    ))
  end

  it "renders new apply_shop form" do
    render

    assert_select "form[action=?][method=?]", apply_shops_path, "post" do

      assert_select "input#apply_shop_name[name=?]", "apply_shop[name]"

      assert_select "input#apply_shop_sex[name=?]", "apply_shop[sex]"

      assert_select "input#apply_shop_tel[name=?]", "apply_shop[tel]"

      assert_select "input#apply_shop_email[name=?]", "apply_shop[email]"

      assert_select "input#apply_shop_creid[name=?]", "apply_shop[creid]"

      assert_select "input#apply_shop_company[name=?]", "apply_shop[company]"

      assert_select "input#apply_shop_shop_id[name=?]", "apply_shop[shop_id]"

      assert_select "input#apply_shop_state[name=?]", "apply_shop[state]"
    end
  end
end
