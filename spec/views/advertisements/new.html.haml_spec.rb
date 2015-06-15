require 'rails_helper'

RSpec.describe "advertisements/new", type: :view do
  before(:each) do
    assign(:advertisement, Advertisement.new(
      :url => "MyString",
      :address => "MyString"
    ))
  end

  it "renders new advertisement form" do
    render

    assert_select "form[action=?][method=?]", advertisements_path, "post" do

      assert_select "input#advertisement_url[name=?]", "advertisement[url]"

      assert_select "input#advertisement_address[name=?]", "advertisement[address]"
    end
  end
end
