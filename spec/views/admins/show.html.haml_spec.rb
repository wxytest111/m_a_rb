require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      :username => "Username",
      :passwd => "Passwd",
      :type => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Passwd/)
    expect(rendered).to match(/1/)
  end
end
