require "spec_helper"

describe FlowObjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/flow_objects").should route_to("flow_objects#index")
    end

    it "routes to #new" do
      get("/flow_objects/new").should route_to("flow_objects#new")
    end

    it "routes to #show" do
      get("/flow_objects/1").should route_to("flow_objects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flow_objects/1/edit").should route_to("flow_objects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flow_objects").should route_to("flow_objects#create")
    end

    it "routes to #update" do
      put("/flow_objects/1").should route_to("flow_objects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flow_objects/1").should route_to("flow_objects#destroy", :id => "1")
    end

  end
end
