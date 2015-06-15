require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "MyString",
      :mobile => "MyString",
      :address => "MyString",
      :description => "MyText",
      :gender => 1,
      :nick_name => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_mobile[name=?]", "customer[mobile]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "textarea#customer_description[name=?]", "customer[description]"

      assert_select "input#customer_gender[name=?]", "customer[gender]"

      assert_select "input#customer_nick_name[name=?]", "customer[nick_name]"

      assert_select "input#customer_password[name=?]", "customer[password]"
    end
  end
end
