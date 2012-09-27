require 'spec_helper'

describe "user_function_assignments/show" do
  before(:each) do
    @user_function_assignment = assign(:user_function_assignment, stub_model(UserFunctionAssignment,
      :user_id => 1,
      :function_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
