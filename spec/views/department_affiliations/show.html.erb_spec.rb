require 'spec_helper'

describe "department_affiliations/show" do
  before(:each) do
    @department_affiliation = assign(:department_affiliation, stub_model(DepartmentAffiliation,
      :user_id => 1,
      :department_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
