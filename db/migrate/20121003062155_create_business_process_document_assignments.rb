class CreateBusinessProcessDocumentAssignments < ActiveRecord::Migration
  def change
    create_table :business_process_document_assignments do |t|
      t.integer :business_process_id
      t.integer :document_id
      t.integer :company_id

      t.timestamps
    end
  end
end
