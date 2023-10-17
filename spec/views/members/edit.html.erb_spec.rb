require 'rails_helper'

RSpec.describe 'members/edit', type: :view do
  let(:member) do
    Member.create!(
      totalPoints: 1,
      full_name: 'MyString',
      position: 'MyString',
      attended: false
    )
  end

  before(:each) do
    assign(:member, member)
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(member), 'post' do
      assert_select 'input[name=?]', 'member[totalPoints]'

      assert_select 'input[name=?]', 'member[weeklyPoints]'

      assert_select 'input[name=?]', 'member[nameFirst]'

      assert_select 'input[name=?]', 'member[nameLast]'

      assert_select 'input[name=?]', 'member[position]'

      assert_select 'input[name=?]', 'member[attended]'
    end
  end
end
