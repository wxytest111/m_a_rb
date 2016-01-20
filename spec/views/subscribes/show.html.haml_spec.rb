require 'rails_helper'

RSpec.describe "subscribes/show", type: :view do
  before(:each) do
    @subscribe = assign(:subscribe, Subscribe.create!(
      :customer => nil,
      :product => nil,
      :pay_record => nil,
      :name => "Name",
      :sex => 1,
      :tel => "Tel",
      :district => nil,
      :address => "Address",
      :waitress => nil,
      :state => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
