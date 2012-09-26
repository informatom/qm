require 'spec_helper'

describe "role_in_companies/edit" do
  before(:each) do
    @role_in_company = assign(:role_in_company, stub_model(RoleInCompany,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit role_in_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => role_in_companies_path(@role_in_company), :method => "post" do
      assert_select "input#role_in_company_name", :name => "role_in_company[name]"
      assert_select "input#role_in_company_company_id", :name => "role_in_company[company_id]"
    end
  end
end
