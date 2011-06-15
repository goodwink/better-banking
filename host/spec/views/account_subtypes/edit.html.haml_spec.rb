require 'spec_helper'

describe "account_subtypes/edit.html.haml" do
  before(:each) do
    @account_subtype = assign(:account_subtype, stub_model(AccountSubtype))
  end

  it "renders the edit account_subtype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_subtypes_path(@account_subtype), :method => "post" do
    end
  end
end
