require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        :username => "Username",
        :passwd => "Passwd",
        :type => 1
      ),
      Admin.create!(
        :username => "Username",
        :passwd => "Passwd",
        :type => 1
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Passwd".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
