require 'spec_helper'

describe "process_steps/show" do
  before(:each) do
    @process_step = assign(:process_step, stub_model(ProcessStep,
      :title => "Title",
      :company_id => 1,
      :description => "MyText",
      :type_id => 2,
      :process_id => 3,
      :created_by => 4,
      :updated_by => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
