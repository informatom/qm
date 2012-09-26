require 'spec_helper'

describe "role_in_companies/show" do
  before(:each) do
    @role_in_company = assign(:role_in_company, stub_model(RoleInCompany,
      :name => "Name",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
