require 'rails_helper'

RSpec.describe 'members/show', type: :view do
  before(:each) do
    assign(:member, Member.create!(
                      totalPoints: 2,
                      weeklyPoints: 3,
                      nameFirst: 'Name First',
                      nameLast: 'Name Last',
                      position: 'Position',
                      attended: false
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name First/)
    expect(rendered).to match(/Name Last/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/false/)
  end
end
