require 'spec_helper'

describe "account_subtypes/index.html.haml" do
  before(:each) do
    assign(:account_subtypes, [
      stub_model(AccountSubtype),
      stub_model(AccountSubtype)
    ])
  end

  it "renders a list of account_subtypes" do
    render
  end
end
