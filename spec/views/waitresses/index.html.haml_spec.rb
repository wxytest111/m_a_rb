require 'rails_helper'

RSpec.describe "waitresses/index", type: :view do
  before(:each) do
    assign(:waitresses, [
      Waitress.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Waitress.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of waitresses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
