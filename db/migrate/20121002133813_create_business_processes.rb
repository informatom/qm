class CreateBusinessProcesses < ActiveRecord::Migration
  def change
    create_table :business_processes do |t|
      t.string :name
      t.integer :company_id
      t.integer :parent_id
      t.string :ancestry
      t.string :purpose
      t.string :number
      t.integer :owner_id
      t.string :aims
      t.integer :process_class_id
      t.text :description

      t.timestamps
    end
  end
end
