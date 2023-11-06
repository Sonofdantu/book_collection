require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        email: "Email",
        event_name: "Event Name"
      ),
      Attendance.create!(
        email: "Email",
        event_name: "Event Name"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Event Name".to_s), count: 2
  end
end
