require 'spec_helper'

describe "sequence_flows/edit" do
  before(:each) do
    @sequence_flow = assign(:sequence_flow, stub_model(SequenceFlow,
      :name => "MyString",
      :source_id => 1,
      :target_id => 1,
      :flow_object_type_id => 1
    ))
  end

  it "renders the edit sequence_flow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sequence_flows_path(@sequence_flow), :method => "post" do
      assert_select "input#sequence_flow_name", :name => "sequence_flow[name]"
      assert_select "input#sequence_flow_source_id", :name => "sequence_flow[source_id]"
      assert_select "input#sequence_flow_target_id", :name => "sequence_flow[target_id]"
      assert_select "input#sequence_flow_flow_object_type_id", :name => "sequence_flow[flow_object_type_id]"
    end
  end
end
