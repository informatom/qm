require 'spec_helper'

describe "instruction_document_assignments/show" do
  before(:each) do
    @instruction_document_assignment = assign(:instruction_document_assignment, stub_model(InstructionDocumentAssignment,
      :instruction_id => 1,
      :document_id => 2,
      :company_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
