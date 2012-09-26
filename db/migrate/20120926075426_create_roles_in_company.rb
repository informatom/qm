class CreateRolesInCompany < ActiveRecord::Migration
  def change
    create_table :roles_in_company do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
