require 'spec_helper'

describe "business_process_department_assignments/show" do
  before(:each) do
    @business_process_department_assignment = assign(:business_process_department_assignment, stub_model(BusinessProcessDepartmentAssignment,
      :business_process_id => 1,
      :department_id => 2,
      :company_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
