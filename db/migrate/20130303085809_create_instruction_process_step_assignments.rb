class CreateInstructionProcessStepAssignments < ActiveRecord::Migration
  def change
    create_table :instruction_process_step_assignments do |t|
      t.integer :instruction_id
      t.integer :process_step_id
      t.integer :company_id

      t.timestamps
    end
  end
end
