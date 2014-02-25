class AddLegacyIdToMany < ActiveRecord::Migration
  def change
    add_column :assignments, :legacy_id, :integer
    add_column :business_processes, :legacy_id, :integer
    add_column :business_process_department_assignments, :legacy_id, :integer
    add_column :business_process_document_assignments, :legacy_id, :integer
    add_column :business_process_note_assignments, :legacy_id, :integer
    add_column :business_process_process_indicator_assignments, :legacy_id, :integer
    add_column :companies, :legacy_id, :integer
    add_column :departments, :legacy_id, :integer
    add_column :department_affiliations, :legacy_id, :integer
    add_column :documents, :legacy_id, :integer
    add_column :document_process_step_assignments, :legacy_id, :integer
    add_column :employments, :legacy_id, :integer
    add_column :functions, :legacy_id, :integer
    add_column :instructions, :legacy_id, :integer
    add_column :instruction_document_assignments, :legacy_id, :integer
    add_column :instruction_process_step_assignments, :legacy_id, :integer
    add_column :notes, :legacy_id, :integer
    add_column :note_process_step_assignments, :legacy_id, :integer
    add_column :process_classes, :legacy_id, :integer
    add_column :process_indicators, :legacy_id, :integer
    add_column :process_steps, :legacy_id, :integer
    add_column :roles_in_company, :legacy_id, :integer
    add_column :sequence_flows, :legacy_id, :integer
    add_column :substitutions, :legacy_id, :integer
    add_column :user_function_assignments, :legacy_id, :integer
    add_column :user_role_in_company_assignments, :legacy_id, :integer
  end
end
