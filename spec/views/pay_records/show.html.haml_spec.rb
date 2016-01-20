require 'rails_helper'

RSpec.describe "pay_records/show", type: :view do
  before(:each) do
    @pay_record = assign(:pay_record, PayRecord.create!(
      :customer => nil,
      :product => nil,
      :shop => nil,
      :pay_state => 1,
      :pay_num => 2,
      :total_count => 3,
      :left_count => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
