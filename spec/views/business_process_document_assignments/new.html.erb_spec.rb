require 'spec_helper'

describe "business_process_document_assignments/new" do
  before(:each) do
    assign(:business_process_document_assignment, stub_model(BusinessProcessDocumentAssignment,
      :business_process_id => 1,
      :document_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new business_process_document_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_process_document_assignments_path, :method => "post" do
      assert_select "input#business_process_document_assignment_business_process_id", :name => "business_process_document_assignment[business_process_id]"
      assert_select "input#business_process_document_assignment_document_id", :name => "business_process_document_assignment[document_id]"
      assert_select "input#business_process_document_assignment_company_id", :name => "business_process_document_assignment[company_id]"
    end
  end
end
