require 'spec_helper'

describe "role_in_companies/new" do
  before(:each) do
    assign(:role_in_company, stub_model(RoleInCompany,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new role_in_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => role_in_companies_path, :method => "post" do
      assert_select "input#role_in_company_name", :name => "role_in_company[name]"
      assert_select "input#role_in_company_company_id", :name => "role_in_company[company_id]"
    end
  end
end
