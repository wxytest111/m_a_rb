require 'rails_helper'

RSpec.describe "advertisements/show", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      :url => "Url",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Address/)
  end
end
