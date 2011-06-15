require 'spec_helper'

describe "transactions/index.html.haml" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction),
      stub_model(Transaction)
    ])
  end

  it "renders a list of transactions" do
    render
  end
end
