require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :duration => 1,
        :period => "MyText",
        :effect => "MyText",
        :applicable => "MyText",
        :kind => 2,
        :howuse => 3,
        :total_count => 4,
        :pic_path => "Pic Path",
        :show_price => 5,
        :pay_price => 6,
        :state => 7,
        :admin => nil
      ),
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :duration => 1,
        :period => "MyText",
        :effect => "MyText",
        :applicable => "MyText",
        :kind => 2,
        :howuse => 3,
        :total_count => 4,
        :pic_path => "Pic Path",
        :show_price => 5,
        :pay_price => 6,
        :state => 7,
        :admin => nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Pic Path".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
