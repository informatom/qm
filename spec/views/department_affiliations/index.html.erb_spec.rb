require 'spec_helper'

describe "department_affiliations/index" do
  before(:each) do
    assign(:department_affiliations, [
      stub_model(DepartmentAffiliation,
        :user_id => 1,
        :department_id => 2
      ),
      stub_model(DepartmentAffiliation,
        :user_id => 1,
        :department_id => 2
      )
    ])
  end

  it "renders a list of department_affiliations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
