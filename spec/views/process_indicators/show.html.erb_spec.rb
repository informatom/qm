require 'spec_helper'

describe "process_indicators/show" do
  before(:each) do
    @process_indicator = assign(:process_indicator, stub_model(ProcessIndicator,
      :name => "Name",
      :company_id => 1,
      :metering_point => "Metering Point",
      :value => "Value",
      :unit => "Unit",
      :nominal_value => "Nominal Value",
      :operator => "Operator",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Metering Point/)
    rendered.should match(/Value/)
    rendered.should match(/Unit/)
    rendered.should match(/Nominal Value/)
    rendered.should match(/Operator/)
    rendered.should match(/MyText/)
  end
end
