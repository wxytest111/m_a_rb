require 'rails_helper'

RSpec.describe "product_details/index", type: :view do
  before(:each) do
    assign(:product_details, [
      ProductDetail.create!(
        :name => "Name",
        :description => "MyText",
        :product => nil
      ),
      ProductDetail.create!(
        :name => "Name",
        :description => "MyText",
        :product => nil
      )
    ])
  end

  it "renders a list of product_details" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
