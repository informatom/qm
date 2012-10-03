class CreateBusinessProcessNoteAssignments < ActiveRecord::Migration
  def change
    create_table :business_process_note_assignments do |t|
      t.integer :business_process_id
      t.integer :note_id
      t.integer :company_id

      t.timestamps
    end
  end
end
