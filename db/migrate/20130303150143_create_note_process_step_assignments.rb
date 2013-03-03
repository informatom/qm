class CreateNoteProcessStepAssignments < ActiveRecord::Migration
  def change
    create_table :note_process_step_assignments do |t|
      t.integer :note_id
      t.integer :process_step_id
      t.integer :company_id

      t.timestamps
    end
  end
end
