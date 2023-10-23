require 'rails_helper'

RSpec.describe 'finances/index', type: :view do
  before(:each) do
    assign(:finances, [
             Finance.create!(
               email: 'Email',
               eventTitle: 'Event Title',
               cost: '9.99',
               receipt: 'MyText',
               reimbursement: 'MyText',
               resolved: false,
               description: 'Description'
             ),
             Finance.create!(
               email: 'Email',
               eventTitle: 'Event Title',
               cost: '9.99',
               receipt: 'MyText',
               reimbursement: 'MyText',
               resolved: false,
               description: 'Description'
             )
           ])
  end

  it 'renders a list of finances' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Event Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
  end
end
