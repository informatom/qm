require 'spec_helper'

describe "InstructionDocumentAssignments" do
  describe "GET /instruction_document_assignments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get instruction_document_assignments_path
      response.status.should be(200)
    end
  end
end
