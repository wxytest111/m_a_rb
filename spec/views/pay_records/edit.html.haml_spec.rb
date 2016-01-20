require 'rails_helper'

RSpec.describe "pay_records/edit", type: :view do
  before(:each) do
    @pay_record = assign(:pay_record, PayRecord.create!(
      :customer => nil,
      :product => nil,
      :shop => nil,
      :pay_state => 1,
      :pay_num => 1,
      :total_count => 1,
      :left_count => 1
    ))
  end

  it "renders the edit pay_record form" do
    render

    assert_select "form[action=?][method=?]", pay_record_path(@pay_record), "post" do

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
