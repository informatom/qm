require "spec_helper"

describe NoteProcessStepAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/note_process_step_assignments").should route_to("note_process_step_assignments#index")
    end

    it "routes to #new" do
      get("/note_process_step_assignments/new").should route_to("note_process_step_assignments#new")
    end

    it "routes to #show" do
      get("/note_process_step_assignments/1").should route_to("note_process_step_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/note_process_step_assignments/1/edit").should route_to("note_process_step_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/note_process_step_assignments").should route_to("note_process_step_assignments#create")
    end

    it "routes to #update" do
      put("/note_process_step_assignments/1").should route_to("note_process_step_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/note_process_step_assignments/1").should route_to("note_process_step_assignments#destroy", :id => "1")
    end

  end
end
