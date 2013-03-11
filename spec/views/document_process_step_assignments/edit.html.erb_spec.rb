require 'spec_helper'

describe "document_process_step_assignments/edit" do
  before(:each) do
    @document_process_step_assignment = assign(:document_process_step_assignment, stub_model(DocumentProcessStepAssignment,
      :document_id => 1,
      :process_step_id => 1,
      :company_id => 1
    ))
  end

  it "renders the edit document_process_step_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_process_step_assignment_path(@document_process_step_assignment), "post" do
      assert_select "input#document_process_step_assignment_document_id[name=?]", "document_process_step_assignment[document_id]"
      assert_select "input#document_process_step_assignment_process_step_id[name=?]", "document_process_step_assignment[process_step_id]"
      assert_select "input#document_process_step_assignment_company_id[name=?]", "document_process_step_assignment[company_id]"
    end
  end
end
