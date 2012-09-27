require 'spec_helper'

describe "user_function_assignments/index" do
  before(:each) do
    assign(:user_function_assignments, [
      stub_model(UserFunctionAssignment,
        :user_id => 1,
        :function_id => 2
      ),
      stub_model(UserFunctionAssignment,
        :user_id => 1,
        :function_id => 2
      )
    ])
  end

  it "renders a list of user_function_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
