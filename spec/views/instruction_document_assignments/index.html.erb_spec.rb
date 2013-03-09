require 'spec_helper'

describe "instruction_document_assignments/index" do
  before(:each) do
    assign(:instruction_document_assignments, [
      stub_model(InstructionDocumentAssignment,
        :instruction_id => 1,
        :document_id => 2,
        :company_id => 3
      ),
      stub_model(InstructionDocumentAssignment,
        :instruction_id => 1,
        :document_id => 2,
        :company_id => 3
      )
    ])
  end

  it "renders a list of instruction_document_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
