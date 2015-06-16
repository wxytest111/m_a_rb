require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :status => 1,
      :address => "MyString",
      :product => nil,
      :service => nil,
      :customer => nil
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input#appointment_status[name=?]", "appointment[status]"

      assert_select "input#appointment_address[name=?]", "appointment[address]"

      assert_select "input#appointment_product_id[name=?]", "appointment[product_id]"

      assert_select "input#appointment_service_id[name=?]", "appointment[service_id]"

      assert_select "input#appointment_customer_id[name=?]", "appointment[customer_id]"
    end
  end
end