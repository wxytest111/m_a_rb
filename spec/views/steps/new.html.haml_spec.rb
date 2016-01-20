require 'rails_helper'

RSpec.describe "steps/new", type: :view do
  before(:each) do
    assign(:step, Step.new(
      :number => 1,
      :product => nil
    ))
  end

  it "renders new step form" do
    render

    assert_select "form[action=?][method=?]", steps_path, "post" do

      assert_select "input#step_number[name=?]", "step[number]"

      assert_select "input#step_product_id[name=?]", "step[product_id]"
    end
  end
end
