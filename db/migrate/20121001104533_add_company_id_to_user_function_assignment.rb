class AddCompanyIdToUserFunctionAssignment < ActiveRecord::Migration
  def change
    add_column :user_function_assignments, :company_id, :integer
  end
end
