require 'spec_helper'

describe "user_role_in_company_assignments/edit" do
  before(:each) do
    @user_role_in_company_assignment = assign(:user_role_in_company_assignment, stub_model(UserRoleInCompanyAssignment,
      :user_id => 1,
      :role_in_company_id => 1
    ))
  end

  it "renders the edit user_role_in_company_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_role_in_company_assignments_path(@user_role_in_company_assignment), :method => "post" do
      assert_select "input#user_role_in_company_assignment_user_id", :name => "user_role_in_company_assignment[user_id]"
      assert_select "input#user_role_in_company_assignment_role_in_company_id", :name => "user_role_in_company_assignment[role_in_company_id]"
    end
  end
end
