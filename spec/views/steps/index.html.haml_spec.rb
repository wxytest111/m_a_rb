require 'rails_helper'

RSpec.describe "steps/index", type: :view do
  before(:each) do
    assign(:steps, [
      Step.create!(
        :number => 1,
        :product => nil
      ),
      Step.create!(
        :number => 1,
        :product => nil
      )
    ])
  end

  it "renders a list of steps" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
