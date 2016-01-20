require 'rails_helper'

RSpec.describe "apply_shops/index", type: :view do
  before(:each) do
    assign(:apply_shops, [
      ApplyShop.create!(
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :email => "Email",
        :creid => "Creid",
        :company => "Company",
        :shop => nil,
        :state => 2
      ),
      ApplyShop.create!(
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :email => "Email",
        :creid => "Creid",
        :company => "Company",
        :shop => nil,
        :state => 2
      )
    ])
  end

  it "renders a list of apply_shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Creid".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
