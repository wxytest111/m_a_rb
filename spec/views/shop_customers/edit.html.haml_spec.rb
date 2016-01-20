require 'rails_helper'

RSpec.describe "shop_customers/edit", type: :view do
  before(:each) do
    @shop_customer = assign(:shop_customer, ShopCustomer.create!(
      :state => 1,
      :shop => nil,
      :customer => nil
    ))
  end

  it "renders the edit shop_customer form" do
    render

    assert_select "form[action=?][method=?]", shop_customer_path(@shop_customer), "post" do

      assert_select "input#shop_customer_state[name=?]", "shop_customer[state]"

      assert_select "input#shop_customer_shop_id[name=?]", "shop_customer[shop_id]"

      assert_select "input#shop_customer_customer_id[name=?]", "shop_customer[customer_id]"
    end
  end
end
