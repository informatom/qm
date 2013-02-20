require "spec_helper"

describe SequenceFlowsController do
  describe "routing" do

    it "routes to #index" do
      get("/sequence_flows").should route_to("sequence_flows#index")
    end

    it "routes to #new" do
      get("/sequence_flows/new").should route_to("sequence_flows#new")
    end

    it "routes to #show" do
      get("/sequence_flows/1").should route_to("sequence_flows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sequence_flows/1/edit").should route_to("sequence_flows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sequence_flows").should route_to("sequence_flows#create")
    end

    it "routes to #update" do
      put("/sequence_flows/1").should route_to("sequence_flows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sequence_flows/1").should route_to("sequence_flows#destroy", :id => "1")
    end

  end
end
