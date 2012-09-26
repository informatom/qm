require 'spec_helper'

describe "substitutions/new" do
  before(:each) do
    assign(:substitution, stub_model(Substitution,
      :user_id => 1,
      :deputy_id => 1
    ).as_new_record)
  end

  it "renders new substitution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => substitutions_path, :method => "post" do
      assert_select "input#substitution_user_id", :name => "substitution[user_id]"
      assert_select "input#substitution_deputy_id", :name => "substitution[deputy_id]"
    end
  end
end
