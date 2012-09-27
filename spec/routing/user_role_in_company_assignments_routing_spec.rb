require "spec_helper"

describe UserRoleInCompanyAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_role_in_company_assignments").should route_to("user_role_in_company_assignments#index")
    end

    it "routes to #new" do
      get("/user_role_in_company_assignments/new").should route_to("user_role_in_company_assignments#new")
    end

    it "routes to #show" do
      get("/user_role_in_company_assignments/1").should route_to("user_role_in_company_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_role_in_company_assignments/1/edit").should route_to("user_role_in_company_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_role_in_company_assignments").should route_to("user_role_in_company_assignments#create")
    end

    it "routes to #update" do
      put("/user_role_in_company_assignments/1").should route_to("user_role_in_company_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_role_in_company_assignments/1").should route_to("user_role_in_company_assignments#destroy", :id => "1")
    end

  end
end
