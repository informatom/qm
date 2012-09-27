class DropOldRelationTables < ActiveRecord::Migration
  def up
    drop_table :functions_users
    drop_table :roles_in_company_users
  end

  def down
    create_table :functions_users do |t|
      t.integer :function_id
      t.integer :user_id
    end

    create_table :roles_in_company_users do |t|
      t.integer :role_in_company_id
      t.integer :user_id
    end
  end
end
