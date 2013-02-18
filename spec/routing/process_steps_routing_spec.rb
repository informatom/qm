require "spec_helper"

describe ProcessStepsController do
  describe "routing" do

    it "routes to #index" do
      get("/process_steps").should route_to("process_steps#index")
    end

    it "routes to #new" do
      get("/process_steps/new").should route_to("process_steps#new")
    end

    it "routes to #show" do
      get("/process_steps/1").should route_to("process_steps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/process_steps/1/edit").should route_to("process_steps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/process_steps").should route_to("process_steps#create")
    end

    it "routes to #update" do
      put("/process_steps/1").should route_to("process_steps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/process_steps/1").should route_to("process_steps#destroy", :id => "1")
    end

  end
end
