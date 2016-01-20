require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :uuid => "Uuid",
      :title => "Title",
      :name => "Name",
      :sex => 1,
      :tel => "Tel",
      :email => "Email",
      :creid => "Creid",
      :company => "Company",
      :login_name => "Login Name",
      :login_pass => "Login Pass",
      :subshop_count => 2,
      :level => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Creid/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Login Name/)
    expect(rendered).to match(/Login Pass/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
