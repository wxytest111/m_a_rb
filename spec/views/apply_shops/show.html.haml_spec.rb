require 'rails_helper'

RSpec.describe "apply_shops/show", type: :view do
  before(:each) do
    @apply_shop = assign(:apply_shop, ApplyShop.create!(
      :name => "Name",
      :sex => 1,
      :tel => "Tel",
      :email => "Email",
      :creid => "Creid",
      :company => "Company",
      :shop => nil,
      :state => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Creid/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
