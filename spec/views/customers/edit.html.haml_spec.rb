require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :uin => "MyString",
      :passwd => "MyString",
      :name => "MyString",
      :sex => 1,
      :tel => "MyString",
      :address => "MyString",
      :district => nil
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_uin[name=?]", "customer[uin]"

      assert_select "input#customer_passwd[name=?]", "customer[passwd]"

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_sex[name=?]", "customer[sex]"

      assert_select "input#customer_tel[name=?]", "customer[tel]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "input#customer_district_id[name=?]", "customer[district_id]"
    end
  end
end
