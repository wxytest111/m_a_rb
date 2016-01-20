require 'rails_helper'

RSpec.describe "birds/index", type: :view do
  before(:each) do
    assign(:birds, [
      Bird.create!(
        :name => "Name"
      ),
      Bird.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of birds" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
