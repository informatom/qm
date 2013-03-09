class CreateInstructionDocumentAssignments < ActiveRecord::Migration
  def change
    create_table :instruction_document_assignments do |t|
      t.integer :instruction_id
      t.integer :document_id
      t.integer :company_id

      t.timestamps
    end
  end
end
