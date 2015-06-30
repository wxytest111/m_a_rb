require 'rails_helper'

RSpec.describe "worker_streets/edit", type: :view do
  before(:each) do
    @worker_street = assign(:worker_street, WorkerStreet.create!(
      :worker => nil,
      :street => nil
    ))
  end

  it "renders the edit worker_street form" do
    render

    assert_select "form[action=?][method=?]", worker_street_path(@worker_street), "post" do

      assert_select "input#worker_street_worker_id[name=?]", "worker_street[worker_id]"

      assert_select "input#worker_street_street_id[name=?]", "worker_street[street_id]"
    end
  end
end
