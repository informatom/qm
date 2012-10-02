require 'spec_helper'

describe "process_indicators/index" do
  before(:each) do
    assign(:process_indicators, [
      stub_model(ProcessIndicator,
        :name => "Name",
        :company_id => 1,
        :metering_point => "Metering Point",
        :value => "Value",
        :unit => "Unit",
        :nominal_value => "Nominal Value",
        :operator => "Operator",
        :description => "MyText"
      ),
      stub_model(ProcessIndicator,
        :name => "Name",
        :company_id => 1,
        :metering_point => "Metering Point",
        :value => "Value",
        :unit => "Unit",
        :nominal_value => "Nominal Value",
        :operator => "Operator",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of process_indicators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Metering Point".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "Nominal Value".to_s, :count => 2
    assert_select "tr>td", :text => "Operator".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
