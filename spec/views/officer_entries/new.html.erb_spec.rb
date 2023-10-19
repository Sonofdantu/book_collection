require 'rails_helper'

RSpec.describe "officer_entries/new", type: :view do
  before(:each) do
    assign(:officer_entry, OfficerEntry.new(
      points: 1,
      email: "MyString",
      description: "MyString"
    ))
  end

  it "renders new officer_entry form" do
    render

    assert_select "form[action=?][method=?]", officer_entries_path, "post" do

      assert_select "input[name=?]", "officer_entry[points]"

      assert_select "input[name=?]", "officer_entry[email]"

      assert_select "input[name=?]", "officer_entry[description]"
    end
  end
end
