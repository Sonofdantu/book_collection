require 'rails_helper'

RSpec.describe 'officer_entries/show', type: :view do
  before(:each) do
    assign(:officer_entry, OfficerEntry.create!(
                             points: 2,
                             email: 'Email',
                             description: 'Description'
                           ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Description/)
  end
end
