require 'spec_helper'

describe "account_subtypes/new.html.haml" do
  before(:each) do
    assign(:account_subtype, stub_model(AccountSubtype).as_new_record)
  end

  it "renders new account_subtype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_subtypes_path, :method => "post" do
    end
  end
end
