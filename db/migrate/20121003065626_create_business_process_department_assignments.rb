class CreateBusinessProcessDepartmentAssignments < ActiveRecord::Migration
  def change
    create_table :business_process_department_assignments do |t|
      t.integer :business_process_id
      t.integer :department_id
      t.integer :company_id

      t.timestamps
    end
  end
end
