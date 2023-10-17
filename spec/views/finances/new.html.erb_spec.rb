require 'rails_helper'

RSpec.describe "finances/new", type: :view do
  before(:each) do
    assign(:finance, Finance.new(
      email: "MyString",
      eventTitle: "MyString",
      cost: "9.99",
      receipt: "MyText",
      reimbursement: "MyText",
      resolved: false,
      description: "MyString"
    ))
  end

  it "renders new finance form" do
    render

    assert_select "form[action=?][method=?]", finances_path, "post" do

      assert_select "input[name=?]", "finance[email]"

      assert_select "input[name=?]", "finance[eventTitle]"

      assert_select "input[name=?]", "finance[cost]"

      assert_select "textarea[name=?]", "finance[receipt]"

      assert_select "textarea[name=?]", "finance[reimbursement]"

      assert_select "input[name=?]", "finance[resolved]"

      assert_select "input[name=?]", "finance[description]"
    end
  end
end
