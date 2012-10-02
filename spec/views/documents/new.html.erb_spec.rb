require 'spec_helper'

describe "documents/new" do
  before(:each) do
    assign(:document, stub_model(Document,
      :name => "MyString",
      :company_id => 1,
      :description => "MyText",
      :internal => false
    ).as_new_record)
  end

  it "renders new document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => documents_path, :method => "post" do
      assert_select "input#document_name", :name => "document[name]"
      assert_select "input#document_company_id", :name => "document[company_id]"
      assert_select "textarea#document_description", :name => "document[description]"
      assert_select "input#document_internal", :name => "document[internal]"
    end
  end
end
