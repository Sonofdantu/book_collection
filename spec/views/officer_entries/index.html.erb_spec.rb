require 'rails_helper'

RSpec.describe "officer_entries/index", type: :view do
  before(:each) do
    assign(:officer_entries, [
      OfficerEntry.create!(
        points: 2,
        email: "Email",
        description: "Description"
      ),
      OfficerEntry.create!(
        points: 2,
        email: "Email",
        description: "Description"
      )
    ])
  end

  it "renders a list of officer_entries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
