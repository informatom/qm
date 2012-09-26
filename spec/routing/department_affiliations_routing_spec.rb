require "spec_helper"

describe DepartmentAffiliationsController do
  describe "routing" do

    it "routes to #index" do
      get("/department_affiliations").should route_to("department_affiliations#index")
    end

    it "routes to #new" do
      get("/department_affiliations/new").should route_to("department_affiliations#new")
    end

    it "routes to #show" do
      get("/department_affiliations/1").should route_to("department_affiliations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/department_affiliations/1/edit").should route_to("department_affiliations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/department_affiliations").should route_to("department_affiliations#create")
    end

    it "routes to #update" do
      put("/department_affiliations/1").should route_to("department_affiliations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/department_affiliations/1").should route_to("department_affiliations#destroy", :id => "1")
    end

  end
end
