require 'spec_helper'

describe "substitutions/show" do
  before(:each) do
    @substitution = assign(:substitution, stub_model(Substitution,
      :user_id => 1,
      :deputy_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
