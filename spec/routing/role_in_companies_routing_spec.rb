require "spec_helper"

describe RoleInCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/role_in_companies").should route_to("role_in_companies#index")
    end

    it "routes to #new" do
      get("/role_in_companies/new").should route_to("role_in_companies#new")
    end

    it "routes to #show" do
      get("/role_in_companies/1").should route_to("role_in_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/role_in_companies/1/edit").should route_to("role_in_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/role_in_companies").should route_to("role_in_companies#create")
    end

    it "routes to #update" do
      put("/role_in_companies/1").should route_to("role_in_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/role_in_companies/1").should route_to("role_in_companies#destroy", :id => "1")
    end

  end
end
