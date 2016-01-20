require 'rails_helper'

RSpec.describe "districts/show", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
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
