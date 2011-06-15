require 'spec_helper'

describe "account_types/edit.html.haml" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType))
  end

  it "renders the edit account_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_types_path(@account_type), :method => "post" do
    end
  end
end
