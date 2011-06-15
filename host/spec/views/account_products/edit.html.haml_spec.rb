require 'spec_helper'

describe "account_products/edit.html.haml" do
  before(:each) do
    @account_product = assign(:account_product, stub_model(AccountProduct))
  end

  it "renders the edit account_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_products_path(@account_product), :method => "post" do
    end
  end
end
