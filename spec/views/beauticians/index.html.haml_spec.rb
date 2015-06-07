require 'rails_helper'

RSpec.describe "beauticians/index", type: :view do
  before(:each) do
    assign(:beauticians, [
      Beautician.create!(
        :name => "Name",
        :mobile => "Mobile",
        :id => "Id"
      ),
      Beautician.create!(
        :name => "Name",
        :mobile => "Mobile",
        :id => "Id"
      )
    ])
  end

  it "renders a list of beauticians" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Id".to_s, :count => 2
  end
end
