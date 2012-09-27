require 'spec_helper'

describe "user_role_in_company_assignments/show" do
  before(:each) do
    @user_role_in_company_assignment = assign(:user_role_in_company_assignment, stub_model(UserRoleInCompanyAssignment,
      :user_id => 1,
      :role_in_company_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
