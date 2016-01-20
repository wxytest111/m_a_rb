require 'rails_helper'

RSpec.describe "waitresses/show", type: :view do
  before(:each) do
    @waitress = assign(:waitress, Waitress.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
