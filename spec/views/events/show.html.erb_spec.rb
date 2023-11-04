require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    assign(:event, Event.create!(
      title: "Title",
      score: 2,
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Password/)
  end
end
