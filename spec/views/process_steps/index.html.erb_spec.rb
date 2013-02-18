require 'spec_helper'

describe "process_steps/index" do
  before(:each) do
    assign(:process_steps, [
      stub_model(ProcessStep,
        :title => "Title",
        :company_id => 1,
        :description => "MyText",
        :type_id => 2,
        :process_id => 3,
        :created_by => 4,
        :updated_by => 5
      ),
      stub_model(ProcessStep,
        :title => "Title",
        :company_id => 1,
        :description => "MyText",
        :type_id => 2,
        :process_id => 3,
        :created_by => 4,
        :updated_by => 5
      )
    ])
  end

  it "renders a list of process_steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
