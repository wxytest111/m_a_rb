require 'rails_helper'

RSpec.describe "shop_customers/index", type: :view do
  before(:each) do
    assign(:shop_customers, [
      ShopCustomer.create!(
        :state => 1,
        :shop => nil,
        :customer => nil
      ),
      ShopCustomer.create!(
        :state => 1,
        :shop => nil,
        :customer => nil
      )
    ])
  end

  it "renders a list of shop_customers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
