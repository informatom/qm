require 'spec_helper'

describe "process_indicators/new" do
  before(:each) do
    assign(:process_indicator, stub_model(ProcessIndicator,
      :name => "MyString",
      :company_id => 1,
      :metering_point => "MyString",
      :value => "MyString",
      :unit => "MyString",
      :nominal_value => "MyString",
      :operator => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new process_indicator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_indicators_path, :method => "post" do
      assert_select "input#process_indicator_name", :name => "process_indicator[name]"
      assert_select "input#process_indicator_company_id", :name => "process_indicator[company_id]"
      assert_select "input#process_indicator_metering_point", :name => "process_indicator[metering_point]"
      assert_select "input#process_indicator_value", :name => "process_indicator[value]"
      assert_select "input#process_indicator_unit", :name => "process_indicator[unit]"
      assert_select "input#process_indicator_nominal_value", :name => "process_indicator[nominal_value]"
      assert_select "input#process_indicator_operator", :name => "process_indicator[operator]"
      assert_select "textarea#process_indicator_description", :name => "process_indicator[description]"
    end
  end
end
