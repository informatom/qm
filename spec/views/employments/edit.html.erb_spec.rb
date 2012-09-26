require 'spec_helper'

describe "employments/edit" do
  before(:each) do
    @employment = assign(:employment, stub_model(Employment,
      :user_id => 1,
      :company_id => 1
    ))
  end

  it "renders the edit employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employments_path(@employment), :method => "post" do
      assert_select "input#employment_user_id", :name => "employment[user_id]"
      assert_select "input#employment_company_id", :name => "employment[company_id]"
    end
  end
end
