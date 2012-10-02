require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :name => "MyString",
      :company_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path(@note), :method => "post" do
      assert_select "input#note_name", :name => "note[name]"
      assert_select "input#note_company_id", :name => "note[company_id]"
      assert_select "textarea#note_description", :name => "note[description]"
    end
  end
end
