require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :name => "MyString",
      :mobile => "MyString",
      :other_name => "MyString",
      :other_mobile => "MyString",
      :street => nil,
      :address => "MyString",
      :postscript => "MyString",
      :status => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_name[name=?]", "order[name]"

      assert_select "input#order_mobile[name=?]", "order[mobile]"

      assert_select "input#order_other_name[name=?]", "order[other_name]"

      assert_select "input#order_other_mobile[name=?]", "order[other_mobile]"

      assert_select "input#order_street_id[name=?]", "order[street_id]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_postscript[name=?]", "order[postscript]"

      assert_select "input#order_status[name=?]", "order[status]"
    end
  end
end
