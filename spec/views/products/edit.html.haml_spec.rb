require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :description => "MyText",
      :duration => 1,
      :period => "MyText",
      :effect => "MyText",
      :applicable => "MyText",
      :kind => 1,
      :howuse => 1,
      :total_count => 1,
      :pic_path => "MyString",
      :show_price => 1,
      :pay_price => 1,
      :state => 1,
      :admin => nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_duration[name=?]", "product[duration]"

      assert_select "textarea#product_period[name=?]", "product[period]"

      assert_select "textarea#product_effect[name=?]", "product[effect]"

      assert_select "textarea#product_applicable[name=?]", "product[applicable]"

      assert_select "input#product_kind[name=?]", "product[kind]"

      assert_select "input#product_howuse[name=?]", "product[howuse]"

      assert_select "input#product_total_count[name=?]", "product[total_count]"

      assert_select "input#product_pic_path[name=?]", "product[pic_path]"

      assert_select "input#product_show_price[name=?]", "product[show_price]"

      assert_select "input#product_pay_price[name=?]", "product[pay_price]"

      assert_select "input#product_state[name=?]", "product[state]"

      assert_select "input#product_admin_id[name=?]", "product[admin_id]"
    end
  end
end
