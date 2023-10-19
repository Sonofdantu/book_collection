require 'rails_helper'

RSpec.describe "officer_entries/edit", type: :view do
  let(:officer_entry) {
    OfficerEntry.create!(
      points: 1,
      email: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:officer_entry, officer_entry)
  end

  it "renders the edit officer_entry form" do
    render

    assert_select "form[action=?][method=?]", officer_entry_path(officer_entry), "post" do

      assert_select "input[name=?]", "officer_entry[points]"

      assert_select "input[name=?]", "officer_entry[email]"

      assert_select "input[name=?]", "officer_entry[description]"
    end
  end
end
