require 'rails_helper'

RSpec.describe "tokens/edit", type: :view do
  before(:each) do
    @token = assign(:token, Token.create!(
      :token => "MyString",
      :customer => "",
      :worker => ""
    ))
  end

  it "renders the edit token form" do
    render

    assert_select "form[action=?][method=?]", token_path(@token), "post" do

      assert_select "input#token_token[name=?]", "token[token]"

      assert_select "input#token_customer[name=?]", "token[customer]"

      assert_select "input#token_worker[name=?]", "token[worker]"
    end
  end
end
