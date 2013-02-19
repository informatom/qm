require 'spec_helper'

describe "flow_objects/show" do
  before(:each) do
    @flow_object = assign(:flow_object, stub_model(FlowObject,
      :name => "Name",
      :class => "Class",
      :image_file_name => "Image File Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Class/)
    rendered.should match(/Image File Name/)
  end
end
