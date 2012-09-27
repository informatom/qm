class CreateUserFunctionAssignments < ActiveRecord::Migration
  def change
    create_table :user_function_assignments do |t|
      t.integer :user_id
      t.integer :function_id

      t.timestamps
    end
  end
end
