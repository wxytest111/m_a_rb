require 'rails_helper'

RSpec.describe "check_codes/index", type: :view do
  before(:each) do
    assign(:check_codes, [
      CheckCode.create!(
        :code => "Code",
        :mobile => "Mobile"
      ),
      CheckCode.create!(
        :code => "Code",
        :mobile => "Mobile"
      )
    ])
  end

  it "renders a list of check_codes" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
  end
end
