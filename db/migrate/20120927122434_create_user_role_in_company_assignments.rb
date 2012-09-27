class CreateUserRoleInCompanyAssignments < ActiveRecord::Migration
  def change
    create_table :user_role_in_company_assignments do |t|
      t.integer :user_id
      t.integer :role_in_company_id

      t.timestamps
    end
  end
end
