require 'rails_helper'

RSpec.describe "grabs/new", type: :view do
  before(:each) do
    assign(:grab, Grab.new(
      :worker => nil,
      :appointment => nil,
      :status => 1
    ))
  end

  it "renders new grab form" do
    render

    assert_select "form[action=?][method=?]", grabs_path, "post" do

      assert_select "input#grab_worker_id[name=?]", "grab[worker_id]"

      assert_select "input#grab_appointment_id[name=?]", "grab[appointment_id]"

      assert_select "input#grab_status[name=?]", "grab[status]"
    end
  end
end
