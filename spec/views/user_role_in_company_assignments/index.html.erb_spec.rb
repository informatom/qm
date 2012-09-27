require 'spec_helper'

describe "user_role_in_company_assignments/index" do
  before(:each) do
    assign(:user_role_in_company_assignments, [
      stub_model(UserRoleInCompanyAssignment,
        :user_id => 1,
        :role_in_company_id => 2
      ),
      stub_model(UserRoleInCompanyAssignment,
        :user_id => 1,
        :role_in_company_id => 2
      )
    ])
  end

  it "renders a list of user_role_in_company_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
