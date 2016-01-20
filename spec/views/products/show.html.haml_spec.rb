require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :description => "MyText",
      :duration => 1,
      :period => "MyText",
      :effect => "MyText",
      :applicable => "MyText",
      :kind => 2,
      :howuse => 3,
      :total_count => 4,
      :pic_path => "Pic Path",
      :show_price => 5,
      :pay_price => 6,
      :state => 7,
      :admin => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Pic Path/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(//)
  end
end
