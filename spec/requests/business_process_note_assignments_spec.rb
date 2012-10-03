require 'spec_helper'

describe "BusinessProcessNoteAssignments" do
  describe "GET /business_process_note_assignments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get business_process_note_assignments_path
      response.status.should be(200)
    end
  end
end
