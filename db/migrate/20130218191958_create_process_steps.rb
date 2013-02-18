class CreateProcessSteps < ActiveRecord::Migration
  def change
    create_table :process_steps do |t|
      t.string :title
      t.integer :company_id
      t.text :description
      t.integer :type_id
      t.integer :business_process_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
