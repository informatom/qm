require "spec_helper"

describe UserFunctionAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_function_assignments").should route_to("user_function_assignments#index")
    end

    it "routes to #new" do
      get("/user_function_assignments/new").should route_to("user_function_assignments#new")
    end

    it "routes to #show" do
      get("/user_function_assignments/1").should route_to("user_function_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_function_assignments/1/edit").should route_to("user_function_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_function_assignments").should route_to("user_function_assignments#create")
    end

    it "routes to #update" do
      put("/user_function_assignments/1").should route_to("user_function_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_function_assignments/1").should route_to("user_function_assignments#destroy", :id => "1")
    end

  end
end
