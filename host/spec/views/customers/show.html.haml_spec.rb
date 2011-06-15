require 'spec_helper'

describe "customers/show.html.haml" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer))
  end

  it "renders attributes in <p>" do
    render
  end
end
