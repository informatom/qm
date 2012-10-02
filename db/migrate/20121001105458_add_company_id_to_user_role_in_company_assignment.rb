class AddCompanyIdToUserRoleInCompanyAssignment < ActiveRecord::Migration
  def change
    add_column :user_role_in_company_assignments, :company_id, :integer
  end
end
