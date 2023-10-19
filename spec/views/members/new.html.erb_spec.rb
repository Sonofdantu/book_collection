require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      totalPoints: 1,
      weeklyPoints: 1,
      nameFirst: "MyString",
      nameLast: "MyString",
      position: "MyString",
      attended: false
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input[name=?]", "member[totalPoints]"

      assert_select "input[name=?]", "member[weeklyPoints]"

      assert_select "input[name=?]", "member[nameFirst]"

      assert_select "input[name=?]", "member[nameLast]"

      assert_select "input[name=?]", "member[position]"

      assert_select "input[name=?]", "member[attended]"
    end
  end
end
