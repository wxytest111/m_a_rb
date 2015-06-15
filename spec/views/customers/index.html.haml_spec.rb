require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :name => "Name",
        :mobile => "Mobile",
        :address => "Address",
        :description => "MyText",
        :gender => 1,
        :nick_name => "Nick Name",
        :password => "Password"
      ),
      Customer.create!(
        :name => "Name",
        :mobile => "Mobile",
        :address => "Address",
        :description => "MyText",
        :gender => 1,
        :nick_name => "Nick Name",
        :password => "Password"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nick Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
