require 'spec_helper'

describe "account_subtypes/show.html.haml" do
  before(:each) do
    @account_subtype = assign(:account_subtype, stub_model(AccountSubtype))
  end

  it "renders attributes in <p>" do
    render
  end
end
