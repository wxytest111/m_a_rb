require 'rails_helper'

RSpec.describe "pay_records/index", type: :view do
  before(:each) do
    assign(:pay_records, [
      PayRecord.create!(
        :customer => nil,
        :product => nil,
        :shop => nil,
        :pay_state => 1,
        :pay_num => 2,
        :total_count => 3,
        :left_count => 4
      ),
      PayRecord.create!(
        :customer => nil,
        :product => nil,
        :shop => nil,
        :pay_state => 1,
        :pay_num => 2,
        :total_count => 3,
        :left_count => 4
      )
    ])
  end

  it "renders a list of pay_records" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
