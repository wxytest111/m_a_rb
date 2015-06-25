require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :name => "Name",
      :mobile => "Mobile",
      :other_name => "Other Name",
      :other_mobile => "Other Mobile",
      :street => nil,
      :address => "Address",
      :postscript => "Postscript",
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Other Name/)
    expect(rendered).to match(/Other Mobile/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Postscript/)
    expect(rendered).to match(/1/)
  end
end
