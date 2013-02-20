require 'spec_helper'

describe "sequence_flows/index" do
  before(:each) do
    assign(:sequence_flows, [
      stub_model(SequenceFlow,
        :name => "Name",
        :source_id => 1,
        :target_id => 2,
        :flow_object_type_id => 3
      ),
      stub_model(SequenceFlow,
        :name => "Name",
        :source_id => 1,
        :target_id => 2,
        :flow_object_type_id => 3
      )
    ])
  end

  it "renders a list of sequence_flows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
