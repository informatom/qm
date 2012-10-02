class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :company_id
      t.text :description
      t.boolean :internal

      t.timestamps
    end
  end
end
