require 'rails_helper'

RSpec.describe "worker_streets/show", type: :view do
  before(:each) do
    @worker_street = assign(:worker_street, WorkerStreet.create!(
      :worker => nil,
      :street => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
