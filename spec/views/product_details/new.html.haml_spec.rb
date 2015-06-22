require 'rails_helper'

RSpec.describe "product_details/new", type: :view do
  before(:each) do
    assign(:product_detail, ProductDetail.new(
      :name => "MyString",
      :description => "MyText",
      :product => nil
    ))
  end

  it "renders new product_detail form" do
    render

    assert_select "form[action=?][method=?]", product_details_path, "post" do

      assert_select "input#product_detail_name[name=?]", "product_detail[name]"

      assert_select "textarea#product_detail_description[name=?]", "product_detail[description]"

      assert_select "input#product_detail_product_id[name=?]", "product_detail[product_id]"
    end
  end
end
