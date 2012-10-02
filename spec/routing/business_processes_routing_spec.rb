require "spec_helper"

describe BusinessProcessesController do
  describe "routing" do

    it "routes to #index" do
      get("/business_processes").should route_to("business_processes#index")
    end

    it "routes to #new" do
      get("/business_processes/new").should route_to("business_processes#new")
    end

    it "routes to #show" do
      get("/business_processes/1").should route_to("business_processes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_processes/1/edit").should route_to("business_processes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_processes").should route_to("business_processes#create")
    end

    it "routes to #update" do
      put("/business_processes/1").should route_to("business_processes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_processes/1").should route_to("business_processes#destroy", :id => "1")
    end

  end
end
