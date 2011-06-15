require 'spec_helper'

describe "account_products/index.html.haml" do
  before(:each) do
    assign(:account_products, [
      stub_model(AccountProduct),
      stub_model(AccountProduct)
    ])
  end

  it "renders a list of account_products" do
    render
  end
end
