require 'rails_helper'

RSpec.describe "tokens/show", type: :view do
  before(:each) do
    @token = assign(:token, Token.create!(
      :token => "Token",
      :customer => "",
      :worker => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Token/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
