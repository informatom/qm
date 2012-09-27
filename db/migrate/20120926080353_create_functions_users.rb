class CreateFunctionsUsers < ActiveRecord::Migration
  def change
    create_table :functions_users do |t|
      t.integer :function_id
      t.integer :user_id
    end
  end
end
