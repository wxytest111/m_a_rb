require 'rails_helper'

RSpec.describe "grabs/show", type: :view do
  before(:each) do
    @grab = assign(:grab, Grab.create!(
      :worker => nil,
      :appointment => nil,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
