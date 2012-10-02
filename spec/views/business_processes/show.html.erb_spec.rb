require 'spec_helper'

describe "business_processes/show" do
  before(:each) do
    @business_process = assign(:business_process, stub_model(BusinessProcess,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Ancestry/)
    rendered.should match(/Purpose/)
    rendered.should match(/Number/)
    rendered.should match(/3/)
    rendered.should match(/Aims/)
    rendered.should match(/4/)
    rendered.should match(/MyText/)
  end
end
