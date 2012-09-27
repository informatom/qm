class CreateRolesInCompanyUsers < ActiveRecord::Migration
  def change
    create_table :roles_in_company_users do |t|
      t.integer :role_in_company_id
      t.integer :user_id
    end
  end
end
