require 'spec_helper'

describe "account_types/index.html.haml" do
  before(:each) do
    assign(:account_types, [
      stub_model(AccountType),
      stub_model(AccountType)
    ])
  end

  it "renders a list of account_types" do
    render
  end
end
