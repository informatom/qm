require "spec_helper"

describe ProcessClassesController do
  describe "routing" do

    it "routes to #index" do
      get("/process_classes").should route_to("process_classes#index")
    end

    it "routes to #new" do
      get("/process_classes/new").should route_to("process_classes#new")
    end

    it "routes to #show" do
      get("/process_classes/1").should route_to("process_classes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/process_classes/1/edit").should route_to("process_classes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/process_classes").should route_to("process_classes#create")
    end

    it "routes to #update" do
      put("/process_classes/1").should route_to("process_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/process_classes/1").should route_to("process_classes#destroy", :id => "1")
    end

  end
end
