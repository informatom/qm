class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.integer :company_id
      t.text :description

      t.timestamps
    end
  end
end
