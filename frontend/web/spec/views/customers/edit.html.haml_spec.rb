require 'spec_helper'

describe "customers/edit.html.haml" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :cif => "MyString",
      :name => "MyString",
      :business? => false,
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_cif", :name => "customer[cif]"
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_business?", :name => "customer[business?]"
      assert_select "input#customer_address1", :name => "customer[address1]"
      assert_select "input#customer_address2", :name => "customer[address2]"
      assert_select "input#customer_city", :name => "customer[city]"
      assert_select "input#customer_state", :name => "customer[state]"
      assert_select "input#customer_zip", :name => "customer[zip]"
    end
  end
end
