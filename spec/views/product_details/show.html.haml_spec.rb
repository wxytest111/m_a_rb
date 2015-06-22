require 'rails_helper'

RSpec.describe "product_details/show", type: :view do
  before(:each) do
    @product_detail = assign(:product_detail, ProductDetail.create!(
      :name => "Name",
      :description => "MyText",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
