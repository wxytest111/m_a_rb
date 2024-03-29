require 'rails_helper'

RSpec.describe "birds/new", type: :view do
  before(:each) do
    assign(:bird, Bird.new(
      :name => "MyString"
    ))
  end

  it "renders new bird form" do
    render

    assert_select "form[action=?][method=?]", birds_path, "post" do

      assert_select "input#bird_name[name=?]", "bird[name]"
    end
  end
end
