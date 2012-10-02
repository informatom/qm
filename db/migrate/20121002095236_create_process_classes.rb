class CreateProcessClasses < ActiveRecord::Migration
  def change
    create_table :process_classes do |t|
      t.string :name
      t.integer :company_id
      t.text :description

      t.timestamps
    end
  end
end
