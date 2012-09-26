require 'spec_helper'

describe "employments/new" do
  before(:each) do
    assign(:employment, stub_model(Employment,
      :user_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employments_path, :method => "post" do
      assert_select "input#employment_user_id", :name => "employment[user_id]"
      assert_select "input#employment_company_id", :name => "employment[company_id]"
    end
  end
end
