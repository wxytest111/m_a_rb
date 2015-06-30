require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        :email => "Email"
      ),
      Admin.create!(
        :email => "Email"
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
