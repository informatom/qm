require 'spec_helper'

describe "document_process_step_assignments/new" do
  before(:each) do
    assign(:document_process_step_assignment, stub_model(DocumentProcessStepAssignment,
      :document_id => 1,
      :process_step_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new document_process_step_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_process_step_assignments_path, "post" do
      assert_select "input#document_process_step_assignment_document_id[name=?]", "document_process_step_assignment[document_id]"
      assert_select "input#document_process_step_assignment_process_step_id[name=?]", "document_process_step_assignment[process_step_id]"
      assert_select "input#document_process_step_assignment_company_id[name=?]", "document_process_step_assignment[company_id]"
    end
  end
end
