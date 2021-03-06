require 'spec_helper'

describe "document_process_step_assignments/show" do
  before(:each) do
    @document_process_step_assignment = assign(:document_process_step_assignment, stub_model(DocumentProcessStepAssignment,
      :document_id => 1,
      :process_step_id => 2,
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
