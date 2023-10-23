require 'rails_helper'

RSpec.describe 'attendances/new', type: :view do
  before(:each) do
    assign(:attendance, Attendance.new(
                          email: 'MyString',
                          event_name: 'MyString'
                        ))
  end

  it 'renders new attendance form' do
    render

    assert_select 'form[action=?][method=?]', attendances_path, 'post' do
      assert_select 'input[name=?]', 'attendance[email]'

      assert_select 'input[name=?]', 'attendance[event_name]'
    end
  end
end
