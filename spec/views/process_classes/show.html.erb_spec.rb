require 'spec_helper'

describe "process_classes/show" do
  before(:each) do
    @process_class = assign(:process_class, stub_model(ProcessClass,
      :name => "Name",
      :company_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
