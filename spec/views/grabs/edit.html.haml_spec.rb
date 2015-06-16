require 'rails_helper'

RSpec.describe "grabs/edit", type: :view do
  before(:each) do
    @grab = assign(:grab, Grab.create!(
      :worker => nil,
      :appointment => nil,
      :status => 1
    ))
  end

  it "renders the edit grab form" do
    render

    assert_select "form[action=?][method=?]", grab_path(@grab), "post" do

      assert_select "input#grab_worker_id[name=?]", "grab[worker_id]"

      assert_select "input#grab_appointment_id[name=?]", "grab[appointment_id]"

      assert_select "input#grab_status[name=?]", "grab[status]"
    end
  end
end
