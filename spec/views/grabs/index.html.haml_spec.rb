require 'rails_helper'

RSpec.describe "grabs/index", type: :view do
  before(:each) do
    assign(:grabs, [
      Grab.create!(
        :worker => nil,
        :appointment => nil,
        :status => 1
      ),
      Grab.create!(
        :worker => nil,
        :appointment => nil,
        :status => 1
      )
    ])
  end

  it "renders a list of grabs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
