require 'rails_helper'

RSpec.describe "areas/show", type: :view do
  before(:each) do
    @area = assign(:area, Area.create!(
      :name => "Name",
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
