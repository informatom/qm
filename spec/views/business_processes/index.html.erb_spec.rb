require 'spec_helper'

describe "business_processes/index" do
  before(:each) do
    assign(:business_processes, [
      stub_model(BusinessProcess,
        :name => "Name",
        :company_id => 1,
        :parent_id => 2,
        :ancestry => "Ancestry",
        :purpose => "Purpose",
        :number => "Number",
        :owner_id => 3,
        :aims => "Aims",
        :process_class_id => 4,
        :description => "MyText"
      ),
      stub_model(BusinessProcess,
        :name => "Name",
        :company_id => 1,
        :parent_id => 2,
        :ancestry => "Ancestry",
        :purpose => "Purpose",
        :number => "Number",
        :owner_id => 3,
        :aims => "Aims",
        :process_class_id => 4,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of business_processes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Ancestry".to_s, :count => 2
    assert_select "tr>td", :text => "Purpose".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Aims".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
