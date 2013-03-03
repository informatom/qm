require 'spec_helper'

describe "NoteProcessStepAssignments" do
  describe "GET /note_process_step_assignments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get note_process_step_assignments_path
      response.status.should be(200)
    end
  end
end
