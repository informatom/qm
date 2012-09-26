require 'spec_helper'

describe "functions/new" do
  before(:each) do
    assign(:function, stub_model(Function,
      :name => "MyString",
      :company_id => ""
    ).as_new_record)
  end

  it "renders new function form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => functions_path, :method => "post" do
      assert_select "input#function_name", :name => "function[name]"
      assert_select "input#function_company_id", :name => "function[company_id]"
    end
  end
end
