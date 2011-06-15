require 'spec_helper'

describe "account_products/show.html.haml" do
  before(:each) do
    @account_product = assign(:account_product, stub_model(AccountProduct))
  end

  it "renders attributes in <p>" do
    render
  end
end
