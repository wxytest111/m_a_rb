require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :customer => nil,
        :price => 1,
        :product => nil,
        :status => 2,
        :order => nil
      ),
      Coupon.create!(
        :customer => nil,
        :price => 1,
        :product => nil,
        :status => 2,
        :order => nil
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
