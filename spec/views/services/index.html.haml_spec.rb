require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :price => 1.5,
        :description => "MyText",
        :pic => "Pic",
        :name => "Name"
      ),
      Service.create!(
        :price => 1.5,
        :description => "MyText",
        :pic => "Pic",
        :name => "Name"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Pic".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
