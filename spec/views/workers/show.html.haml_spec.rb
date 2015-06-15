require 'rails_helper'

RSpec.describe "workers/show", type: :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :name => "Name",
      :mobile => "Mobile",
      :avatar => "Avatar",
      :star => 1.5,
      :gender => 1,
      :description => "MyText",
      :skills => "Skills"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Skills/)
  end
end
