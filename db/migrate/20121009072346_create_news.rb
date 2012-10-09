class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :description
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
