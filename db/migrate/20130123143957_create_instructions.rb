class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :title
      t.integer :company_id
      t.string :number
      t.integer :created_by
      t.integer :updated_by
      t.integer :in_charge_id
      t.integer :controlled_by_id
      t.integer :released_by_id
      t.integer :scope_id
      t.date :revision_date
      t.text :tasks
      t.text :ressources
      t.text :necessary_information
      t.text :security
      t.text :ecology
      t.text :on_deviation

      t.timestamps
    end
  end
end
