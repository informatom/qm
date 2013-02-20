require 'spec_helper'

describe "sequence_flows/new" do
  before(:each) do
    assign(:sequence_flow, stub_model(SequenceFlow,
      :name => "MyString",
      :source_id => 1,
      :target_id => 1,
      :flow_object_type_id => 1
    ).as_new_record)
  end

  it "renders new sequence_flow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sequence_flows_path, :method => "post" do
      assert_select "input#sequence_flow_name", :name => "sequence_flow[name]"
      assert_select "input#sequence_flow_source_id", :name => "sequence_flow[source_id]"
      assert_select "input#sequence_flow_target_id", :name => "sequence_flow[target_id]"
      assert_select "input#sequence_flow_flow_object_type_id", :name => "sequence_flow[flow_object_type_id]"
    end
  end
end
