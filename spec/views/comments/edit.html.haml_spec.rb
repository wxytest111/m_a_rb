require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :order => nil,
      :description => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_order_id[name=?]", "comment[order_id]"

      assert_select "input#comment_description[name=?]", "comment[description]"
    end
  end
end
