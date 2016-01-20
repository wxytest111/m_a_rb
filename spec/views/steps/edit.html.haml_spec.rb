require 'rails_helper'

RSpec.describe "steps/edit", type: :view do
  before(:each) do
    @step = assign(:step, Step.create!(
      :number => 1,
      :product => nil
    ))
  end

  it "renders the edit step form" do
    render

    assert_select "form[action=?][method=?]", step_path(@step), "post" do

      assert_select "input#step_number[name=?]", "step[number]"

      assert_select "input#step_product_id[name=?]", "step[product_id]"
    end
  end
end
