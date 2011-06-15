require "spec_helper"

describe AccountSubtypesController do
  describe "routing" do

    it "routes to #index" do
      get("/account_subtypes").should route_to("account_subtypes#index")
    end

    it "routes to #new" do
      get("/account_subtypes/new").should route_to("account_subtypes#new")
    end

    it "routes to #show" do
      get("/account_subtypes/1").should route_to("account_subtypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_subtypes/1/edit").should route_to("account_subtypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_subtypes").should route_to("account_subtypes#create")
    end

    it "routes to #update" do
      put("/account_subtypes/1").should route_to("account_subtypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_subtypes/1").should route_to("account_subtypes#destroy", :id => "1")
    end

  end
end
