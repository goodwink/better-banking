require "spec_helper"

describe AccountProductsController do
  describe "routing" do

    it "routes to #index" do
      get("/account_products").should route_to("account_products#index")
    end

    it "routes to #new" do
      get("/account_products/new").should route_to("account_products#new")
    end

    it "routes to #show" do
      get("/account_products/1").should route_to("account_products#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_products/1/edit").should route_to("account_products#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_products").should route_to("account_products#create")
    end

    it "routes to #update" do
      put("/account_products/1").should route_to("account_products#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_products/1").should route_to("account_products#destroy", :id => "1")
    end

  end
end
