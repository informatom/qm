require 'spec_helper'

describe "flow_objects/new" do
  before(:each) do
    assign(:flow_object, stub_model(FlowObject,
      :name => "MyString",
      :class => "MyString",
      :image_file_name => "MyString"
    ).as_new_record)
  end

  it "renders new flow_object form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => flow_objects_path, :method => "post" do
      assert_select "input#flow_object_name", :name => "flow_object[name]"
      assert_select "input#flow_object_class", :name => "flow_object[class]"
      assert_select "input#flow_object_image_file_name", :name => "flow_object[image_file_name]"
    end
  end
end
