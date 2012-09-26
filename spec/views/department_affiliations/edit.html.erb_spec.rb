require 'spec_helper'

describe "department_affiliations/edit" do
  before(:each) do
    @department_affiliation = assign(:department_affiliation, stub_model(DepartmentAffiliation,
      :user_id => 1,
      :department_id => 1
    ))
  end

  it "renders the edit department_affiliation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => department_affiliations_path(@department_affiliation), :method => "post" do
      assert_select "input#department_affiliation_user_id", :name => "department_affiliation[user_id]"
      assert_select "input#department_affiliation_department_id", :name => "department_affiliation[department_id]"
    end
  end
end
