require 'rails_helper'

RSpec.describe "tokens/new", type: :view do
  before(:each) do
    assign(:token, Token.new(
      :token => "MyString",
      :customer => "",
      :worker => ""
    ))
  end

  it "renders new token form" do
    render

    assert_select "form[action=?][method=?]", tokens_path, "post" do

      assert_select "input#token_token[name=?]", "token[token]"

      assert_select "input#token_customer[name=?]", "token[customer]"

      assert_select "input#token_worker[name=?]", "token[worker]"
    end
  end
end
