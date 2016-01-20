require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :uin => "Uin",
      :passwd => "Passwd",
      :name => "Name",
      :sex => 1,
      :tel => "Tel",
      :address => "Address",
      :district => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uin/)
    expect(rendered).to match(/Passwd/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
  end
end
