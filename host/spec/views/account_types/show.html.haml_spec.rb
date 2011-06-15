require 'spec_helper'

describe "account_types/show.html.haml" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType))
  end

  it "renders attributes in <p>" do
    render
  end
end
