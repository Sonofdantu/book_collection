require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        totalPoints: 2,
        weeklyPoints: 3,
        nameFirst: "Name First",
        nameLast: "Name Last",
        position: "Position",
        attended: false
      ),
      Member.create!(
        totalPoints: 2,
        weeklyPoints: 3,
        nameFirst: "Name First",
        nameLast: "Name Last",
        position: "Position",
        attended: false
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name First".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name Last".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Position".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
