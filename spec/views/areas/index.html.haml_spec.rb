require 'rails_helper'

RSpec.describe "areas/index", type: :view do
  before(:each) do
    assign(:areas, [
      Area.create!(
        :name => "Name",
        :city => nil
      ),
      Area.create!(
        :name => "Name",
        :city => nil
      )
    ])
  end

  it "renders a list of areas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
