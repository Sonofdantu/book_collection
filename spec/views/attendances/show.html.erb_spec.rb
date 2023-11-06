require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    assign(:attendance, Attendance.create!(
      email: "Email",
      event_name: "Event Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Event Name/)
  end
end
