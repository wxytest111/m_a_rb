require 'rails_helper'

RSpec.describe "product_details/edit", type: :view do
  before(:each) do
    @product_detail = assign(:product_detail, ProductDetail.create!(
      :name => "MyString",
      :description => "MyText",
      :product => nil
    ))
  end

  it "renders the edit product_detail form" do
    render

    assert_select "form[action=?][method=?]", product_detail_path(@product_detail), "post" do

      assert_select "input#product_detail_name[name=?]", "product_detail[name]"

      assert_select "textarea#product_detail_description[name=?]", "product_detail[description]"

      assert_select "input#product_detail_product_id[name=?]", "product_detail[product_id]"
    end
  end
end
