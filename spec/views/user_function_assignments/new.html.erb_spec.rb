require 'spec_helper'

describe "user_function_assignments/new" do
  before(:each) do
    assign(:user_function_assignment, stub_model(UserFunctionAssignment,
      :user_id => 1,
      :function_id => 1
    ).as_new_record)
  end

  it "renders new user_function_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_function_assignments_path, :method => "post" do
      assert_select "input#user_function_assignment_user_id", :name => "user_function_assignment[user_id]"
      assert_select "input#user_function_assignment_function_id", :name => "user_function_assignment[function_id]"
    end
  end
end
