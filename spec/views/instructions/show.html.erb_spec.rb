require 'spec_helper'

describe "instructions/show" do
  before(:each) do
    @instruction = assign(:instruction, stub_model(Instruction,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Number/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
