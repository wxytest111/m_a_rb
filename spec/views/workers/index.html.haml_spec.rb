require 'rails_helper'

RSpec.describe "workers/index", type: :view do
  before(:each) do
    assign(:workers, [
      Worker.create!(
        :name => "Name",
        :mobile => "Mobile",
        :avatar => "Avatar",
        :star => 1.5,
        :gender => 1,
        :description => "MyText",
        :skills => "Skills"
      ),
      Worker.create!(
        :name => "Name",
        :mobile => "Mobile",
        :avatar => "Avatar",
        :star => 1.5,
        :gender => 1,
        :description => "MyText",
        :skills => "Skills"
      )
    ])
  end

  it "renders a list of workers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Skills".to_s, :count => 2
  end
end
