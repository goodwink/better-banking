require 'spec_helper'

describe "customers/index.html.haml" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer),
      stub_model(Customer)
    ])
  end

  it "renders a list of customers" do
    render
  end
end
