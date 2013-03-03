require 'spec_helper'

describe "instruction_process_step_assignments/edit" do
  before(:each) do
    @instruction_process_step_assignment = assign(:instruction_process_step_assignment, stub_model(InstructionProcessStepAssignment,
      :instruction_id => 1,
      :process_step_id => 1,
      :company_id => 1
    ))
  end

  it "renders the edit instruction_process_step_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instruction_process_step_assignment_path(@instruction_process_step_assignment), "post" do
      assert_select "input#instruction_process_step_assignment_instruction_id[name=?]", "instruction_process_step_assignment[instruction_id]"
      assert_select "input#instruction_process_step_assignment_process_step_id[name=?]", "instruction_process_step_assignment[process_step_id]"
      assert_select "input#instruction_process_step_assignment_company_id[name=?]", "instruction_process_step_assignment[company_id]"
    end
  end
end
