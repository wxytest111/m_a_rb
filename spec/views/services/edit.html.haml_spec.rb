require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :price => 1.5,
      :description => "MyText",
      :pic => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_price[name=?]", "service[price]"

      assert_select "textarea#service_description[name=?]", "service[description]"

      assert_select "input#service_pic[name=?]", "service[pic]"

      assert_select "input#service_name[name=?]", "service[name]"
    end
  end
end
