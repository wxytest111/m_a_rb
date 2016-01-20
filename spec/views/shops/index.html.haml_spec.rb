require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
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
      ),
      Shop.create!(
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
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Creid".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Login Name".to_s, :count => 2
    assert_select "tr>td", :text => "Login Pass".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
