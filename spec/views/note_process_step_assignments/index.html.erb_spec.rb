require 'spec_helper'

describe "note_process_step_assignments/index" do
  before(:each) do
    assign(:note_process_step_assignments, [
      stub_model(NoteProcessStepAssignment,
        :note_id => 1,
        :process_step_id => 2,
        :company_id => 3
      ),
      stub_model(NoteProcessStepAssignment,
        :note_id => 1,
        :process_step_id => 2,
        :company_id => 3
      )
    ])
  end

  it "renders a list of note_process_step_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
