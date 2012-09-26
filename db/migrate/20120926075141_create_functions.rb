class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
