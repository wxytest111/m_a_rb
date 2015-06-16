require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :price => 1.5,
      :description => "MyText",
      :pic => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_price[name=?]", "service[price]"

      assert_select "textarea#service_description[name=?]", "service[description]"

      assert_select "input#service_pic[name=?]", "service[pic]"

      assert_select "input#service_name[name=?]", "service[name]"
    end
  end
end
