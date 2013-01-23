require 'spec_helper'

describe "instructions/edit" do
  before(:each) do
    @instruction = assign(:instruction, stub_model(Instruction,
      :title => "MyString",
      :company_id => 1,
      :number => "MyString",
      :created_by => 1,
      :updated_by => 1,
      :in_charge => 1,
      :controlled_by => 1,
      :released_by => 1,
      :scope => 1,
      :tasks => "MyText",
      :ressources => "MyText",
      :necessary_information => "MyText",
      :security => "MyText",
      :ecology => "MyText",
      :on_deviation => "MyText"
    ))
  end

  it "renders the edit instruction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => instructions_path(@instruction), :method => "post" do
      assert_select "input#instruction_title", :name => "instruction[title]"
      assert_select "input#instruction_company_id", :name => "instruction[company_id]"
      assert_select "input#instruction_number", :name => "instruction[number]"
      assert_select "input#instruction_created_by", :name => "instruction[created_by]"
      assert_select "input#instruction_updated_by", :name => "instruction[updated_by]"
      assert_select "input#instruction_in_charge", :name => "instruction[in_charge]"
      assert_select "input#instruction_controlled_by", :name => "instruction[controlled_by]"
      assert_select "input#instruction_released_by", :name => "instruction[released_by]"
      assert_select "input#instruction_scope", :name => "instruction[scope]"
      assert_select "textarea#instruction_tasks", :name => "instruction[tasks]"
      assert_select "textarea#instruction_ressources", :name => "instruction[ressources]"
      assert_select "textarea#instruction_necessary_information", :name => "instruction[necessary_information]"
      assert_select "textarea#instruction_security", :name => "instruction[security]"
      assert_select "textarea#instruction_ecology", :name => "instruction[ecology]"
      assert_select "textarea#instruction_on_deviation", :name => "instruction[on_deviation]"
    end
  end
end
