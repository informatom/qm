require 'spec_helper'

describe "sequence_flows/show" do
  before(:each) do
    @sequence_flow = assign(:sequence_flow, stub_model(SequenceFlow,
      :name => "Name",
      :source_id => 1,
      :target_id => 2,
      :flow_object_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
