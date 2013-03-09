class CreateDocumentProcessStepAssignments < ActiveRecord::Migration
  def change
    create_table :document_process_step_assignments do |t|
      t.integer :document_id
      t.integer :process_step_id
      t.integer :company_id

      t.timestamps
    end
  end
end
