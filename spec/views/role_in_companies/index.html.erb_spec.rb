require 'spec_helper'

describe "role_in_companies/index" do
  before(:each) do
    assign(:role_in_companies, [
      stub_model(RoleInCompany,
        :name => "Name",
        :company_id => 1
      ),
      stub_model(RoleInCompany,
        :name => "Name",
        :company_id => 1
      )
    ])
  end

  it "renders a list of role_in_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
