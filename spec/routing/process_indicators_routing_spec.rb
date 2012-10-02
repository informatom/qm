require "spec_helper"

describe ProcessIndicatorsController do
  describe "routing" do

    it "routes to #index" do
      get("/process_indicators").should route_to("process_indicators#index")
    end

    it "routes to #new" do
      get("/process_indicators/new").should route_to("process_indicators#new")
    end

    it "routes to #show" do
      get("/process_indicators/1").should route_to("process_indicators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/process_indicators/1/edit").should route_to("process_indicators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/process_indicators").should route_to("process_indicators#create")
    end

    it "routes to #update" do
      put("/process_indicators/1").should route_to("process_indicators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/process_indicators/1").should route_to("process_indicators#destroy", :id => "1")
    end

  end
end
