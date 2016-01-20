require 'rails_helper'

RSpec.describe "shop_customers/new", type: :view do
  before(:each) do
    assign(:shop_customer, ShopCustomer.new(
      :state => 1,
      :shop => nil,
      :customer => nil
    ))
  end

  it "renders new shop_customer form" do
    render

    assert_select "form[action=?][method=?]", shop_customers_path, "post" do

      assert_select "input#shop_customer_state[name=?]", "shop_customer[state]"

      assert_select "input#shop_customer_shop_id[name=?]", "shop_customer[shop_id]"

      assert_select "input#shop_customer_customer_id[name=?]", "shop_customer[customer_id]"
    end
  end
end
