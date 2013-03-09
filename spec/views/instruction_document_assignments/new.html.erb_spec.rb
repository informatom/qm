require 'spec_helper'

describe "instruction_document_assignments/new" do
  before(:each) do
    assign(:instruction_document_assignment, stub_model(InstructionDocumentAssignment,
      :instruction_id => 1,
      :document_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new instruction_document_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instruction_document_assignments_path, "post" do
      assert_select "input#instruction_document_assignment_instruction_id[name=?]", "instruction_document_assignment[instruction_id]"
      assert_select "input#instruction_document_assignment_document_id[name=?]", "instruction_document_assignment[document_id]"
      assert_select "input#instruction_document_assignment_company_id[name=?]", "instruction_document_assignment[company_id]"
    end
  end
end
