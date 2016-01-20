require 'rails_helper'

RSpec.describe "shop_customers/show", type: :view do
  before(:each) do
    @shop_customer = assign(:shop_customer, ShopCustomer.create!(
      :state => 1,
      :shop => nil,
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
