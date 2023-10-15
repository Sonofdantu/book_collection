require 'rails_helper'

RSpec.describe "finances/show", type: :view do
  before(:each) do
    assign(:finance, Finance.create!(
      email: "Email",
      eventTitle: "Event Title",
      cost: "9.99",
      receipt: "MyText",
      reimbursement: "MyText",
      resolved: false,
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Event Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Description/)
  end
end
