require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :name => "Name",
        :mobile => "Mobile",
        :other_name => "Other Name",
        :other_mobile => "Other Mobile",
        :street => nil,
        :address => "Address",
        :postscript => "Postscript",
        :status => 1
      ),
      Order.create!(
        :name => "Name",
        :mobile => "Mobile",
        :other_name => "Other Name",
        :other_mobile => "Other Mobile",
        :street => nil,
        :address => "Address",
        :postscript => "Postscript",
        :status => 1
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Other Name".to_s, :count => 2
    assert_select "tr>td", :text => "Other Mobile".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postscript".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
