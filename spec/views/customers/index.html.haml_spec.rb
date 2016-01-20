require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :uin => "Uin",
        :passwd => "Passwd",
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :address => "Address",
        :district => nil
      ),
      Customer.create!(
        :uin => "Uin",
        :passwd => "Passwd",
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :address => "Address",
        :district => nil
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Uin".to_s, :count => 2
    assert_select "tr>td", :text => "Passwd".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
