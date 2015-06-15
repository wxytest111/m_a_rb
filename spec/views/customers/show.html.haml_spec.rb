require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "Name",
      :mobile => "Mobile",
      :address => "Address",
      :description => "MyText",
      :gender => 1,
      :nick_name => "Nick Name",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Nick Name/)
    expect(rendered).to match(/Password/)
  end
end
