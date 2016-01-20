require 'rails_helper'

RSpec.describe "subscribes/index", type: :view do
  before(:each) do
    assign(:subscribes, [
      Subscribe.create!(
        :customer => nil,
        :product => nil,
        :pay_record => nil,
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :district => nil,
        :address => "Address",
        :waitress => nil,
        :state => 2
      ),
      Subscribe.create!(
        :customer => nil,
        :product => nil,
        :pay_record => nil,
        :name => "Name",
        :sex => 1,
        :tel => "Tel",
        :district => nil,
        :address => "Address",
        :waitress => nil,
        :state => 2
      )
    ])
  end

  it "renders a list of subscribes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
