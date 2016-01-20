require 'rails_helper'

RSpec.describe "subscribes/new", type: :view do
  before(:each) do
    assign(:subscribe, Subscribe.new(
      :customer => nil,
      :product => nil,
      :pay_record => nil,
      :name => "MyString",
      :sex => 1,
      :tel => "MyString",
      :district => nil,
      :address => "MyString",
      :waitress => nil,
      :state => 1
    ))
  end

  it "renders new subscribe form" do
    render

    assert_select "form[action=?][method=?]", subscribes_path, "post" do

      assert_select "input#subscribe_customer_id[name=?]", "subscribe[customer_id]"

      assert_select "input#subscribe_product_id[name=?]", "subscribe[product_id]"

      assert_select "input#subscribe_pay_record_id[name=?]", "subscribe[pay_record_id]"

      assert_select "input#subscribe_name[name=?]", "subscribe[name]"

      assert_select "input#subscribe_sex[name=?]", "subscribe[sex]"

      assert_select "input#subscribe_tel[name=?]", "subscribe[tel]"

      assert_select "input#subscribe_district_id[name=?]", "subscribe[district_id]"

      assert_select "input#subscribe_address[name=?]", "subscribe[address]"

      assert_select "input#subscribe_waitress_id[name=?]", "subscribe[waitress_id]"

      assert_select "input#subscribe_state[name=?]", "subscribe[state]"
    end
  end
end
