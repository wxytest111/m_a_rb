require 'rails_helper'

RSpec.describe "beauticians/show", type: :view do
  before(:each) do
    @beautician = assign(:beautician, Beautician.create!(
      :name => "Name",
      :mobile => "Mobile",
      :id => "Id"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Id/)
  end
end
