require 'rails_helper'

RSpec.describe "worker_streets/new", type: :view do
  before(:each) do
    assign(:worker_street, WorkerStreet.new(
      :worker => nil,
      :street => nil
    ))
  end

  it "renders new worker_street form" do
    render

    assert_select "form[action=?][method=?]", worker_streets_path, "post" do

      assert_select "input#worker_street_worker_id[name=?]", "worker_street[worker_id]"

      assert_select "input#worker_street_street_id[name=?]", "worker_street[street_id]"
    end
  end
end
