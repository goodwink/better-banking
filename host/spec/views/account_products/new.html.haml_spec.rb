require 'spec_helper'

describe "account_products/new.html.haml" do
  before(:each) do
    assign(:account_product, stub_model(AccountProduct).as_new_record)
  end

  it "renders new account_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_products_path, :method => "post" do
    end
  end
end
