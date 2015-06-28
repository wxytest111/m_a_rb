require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      :customer => nil,
      :price => 1,
      :product => nil,
      :status => 1,
      :order => nil
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input#coupon_customer_id[name=?]", "coupon[customer_id]"

      assert_select "input#coupon_price[name=?]", "coupon[price]"

      assert_select "input#coupon_product_id[name=?]", "coupon[product_id]"

      assert_select "input#coupon_status[name=?]", "coupon[status]"

      assert_select "input#coupon_order_id[name=?]", "coupon[order_id]"
    end
  end
end
