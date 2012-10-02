require 'spec_helper'

describe "process_classes/new" do
  before(:each) do
    assign(:process_class, stub_model(ProcessClass,
      :name => "MyString",
      :company_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new process_class form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_classes_path, :method => "post" do
      assert_select "input#process_class_name", :name => "process_class[name]"
      assert_select "input#process_class_company_id", :name => "process_class[company_id]"
      assert_select "textarea#process_class_description", :name => "process_class[description]"
    end
  end
end
