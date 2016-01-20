require 'rails_helper'

RSpec.describe "pay_records/new", type: :view do
  before(:each) do
    assign(:pay_record, PayRecord.new(
      :customer => nil,
      :product => nil,
      :shop => nil,
      :pay_state => 1,
      :pay_num => 1,
      :total_count => 1,
      :left_count => 1
    ))
  end

  it "renders new pay_record form" do
    render

    assert_select "form[action=?][method=?]", pay_records_path, "post" do

      assert_select "input#pay_record_customer_id[name=?]", "pay_record[customer_id]"

      assert_select "input#pay_record_product_id[name=?]", "pay_record[product_id]"

      assert_select "input#pay_record_shop_id[name=?]", "pay_record[shop_id]"

      assert_select "input#pay_record_pay_state[name=?]", "pay_record[pay_state]"

      assert_select "input#pay_record_pay_num[name=?]", "pay_record[pay_num]"

      assert_select "input#pay_record_total_count[name=?]", "pay_record[total_count]"

      assert_select "input#pay_record_left_count[name=?]", "pay_record[left_count]"
    end
  end
end
