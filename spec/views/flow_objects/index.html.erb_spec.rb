require 'spec_helper'

describe "flow_objects/index" do
  before(:each) do
    assign(:flow_objects, [
      stub_model(FlowObject,
        :name => "Name",
        :class => "Class",
        :image_file_name => "Image File Name"
      ),
      stub_model(FlowObject,
        :name => "Name",
        :class => "Class",
        :image_file_name => "Image File Name"
      )
    ])
  end

  it "renders a list of flow_objects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Class".to_s, :count => 2
    assert_select "tr>td", :text => "Image File Name".to_s, :count => 2
  end
end
