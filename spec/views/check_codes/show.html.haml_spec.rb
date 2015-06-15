require 'rails_helper'

RSpec.describe "check_codes/show", type: :view do
  before(:each) do
    @check_code = assign(:check_code, CheckCode.create!(
      :code => "Code",
      :mobile => "Mobile"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Mobile/)
  end
end
