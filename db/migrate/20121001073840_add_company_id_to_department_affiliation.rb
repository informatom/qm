class AddCompanyIdToDepartmentAffiliation < ActiveRecord::Migration
  def change
    add_column :department_affiliations, :company_id, :integer
  end
end
