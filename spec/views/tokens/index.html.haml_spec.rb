require 'rails_helper'

RSpec.describe "tokens/index", type: :view do
  before(:each) do
    assign(:tokens, [
      Token.create!(
        :token => "Token",
        :customer => "",
        :worker => ""
      ),
      Token.create!(
        :token => "Token",
        :customer => "",
        :worker => ""
      )
    ])
  end

  it "renders a list of tokens" do
    render
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
