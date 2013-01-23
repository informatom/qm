require 'spec_helper'

describe "instructions/index" do
  before(:each) do
    assign(:instructions, [
      stub_model(Instruction,
        :title => "Title",
        :company_id => 1,
        :number => "Number",
        :created_by => 2,
        :updated_by => 3,
        :in_charge => 4,
        :controlled_by => 5,
        :released_by => 6,
        :scope => 7,
        :tasks => "MyText",
        :ressources => "MyText",
        :necessary_information => "MyText",
        :security => "MyText",
        :ecology => "MyText",
        :on_deviation => "MyText"
      ),
      stub_model(Instruction,
        :title => "Title",
        :company_id => 1,
        :number => "Number",
        :created_by => 2,
        :updated_by => 3,
        :in_charge => 4,
        :controlled_by => 5,
        :released_by => 6,
        :scope => 7,
        :tasks => "MyText",
        :ressources => "MyText",
        :necessary_information => "MyText",
        :security => "MyText",
        :ecology => "MyText",
        :on_deviation => "MyText"
      )
    ])
  end

  it "renders a list of instructions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
