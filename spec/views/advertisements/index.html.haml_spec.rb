require 'rails_helper'

RSpec.describe "advertisements/index", type: :view do
  before(:each) do
    assign(:advertisements, [
      Advertisement.create!(
        :url => "Url",
        :address => "Address"
      ),
      Advertisement.create!(
        :url => "Url",
        :address => "Address"
      )
    ])
  end

  it "renders a list of advertisements" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
