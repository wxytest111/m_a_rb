require 'rails_helper'

RSpec.describe "workers/new", type: :view do
  before(:each) do
    assign(:worker, Worker.new(
      :name => "MyString",
      :mobile => "MyString",
      :avatar => "MyString",
      :star => 1.5,
      :gender => 1,
      :description => "MyText",
      :skills => "MyString"
    ))
  end

  it "renders new worker form" do
    render

    assert_select "form[action=?][method=?]", workers_path, "post" do

      assert_select "input#worker_name[name=?]", "worker[name]"

      assert_select "input#worker_mobile[name=?]", "worker[mobile]"

      assert_select "input#worker_avatar[name=?]", "worker[avatar]"

      assert_select "input#worker_star[name=?]", "worker[star]"

      assert_select "input#worker_gender[name=?]", "worker[gender]"

      assert_select "textarea#worker_description[name=?]", "worker[description]"

      assert_select "input#worker_skills[name=?]", "worker[skills]"
    end
  end
end
