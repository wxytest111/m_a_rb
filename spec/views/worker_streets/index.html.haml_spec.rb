require 'rails_helper'

RSpec.describe "worker_streets/index", type: :view do
  before(:each) do
    assign(:worker_streets, [
      WorkerStreet.create!(
        :worker => nil,
        :street => nil
      ),
      WorkerStreet.create!(
        :worker => nil,
        :street => nil
      )
    ])
  end

  it "renders a list of worker_streets" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
