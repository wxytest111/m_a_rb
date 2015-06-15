require 'rails_helper'

RSpec.describe "advertisements/edit", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      :url => "MyString",
      :address => "MyString"
    ))
  end

  it "renders the edit advertisement form" do
    render

    assert_select "form[action=?][method=?]", advertisement_path(@advertisement), "post" do

      assert_select "input#advertisement_url[name=?]", "advertisement[url]"

      assert_select "input#advertisement_address[name=?]", "advertisement[address]"
    end
  end
end
