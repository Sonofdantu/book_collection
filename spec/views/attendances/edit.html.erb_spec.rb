require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  let(:attendance) {
    Attendance.create!(
      email: "MyString",
      event_name: "MyString"
    )
  }

  before(:each) do
    assign(:attendance, attendance)
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(attendance), "post" do

      assert_select "input[name=?]", "attendance[email]"

      assert_select "input[name=?]", "attendance[event_name]"
    end
  end
end
