class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :name

      t.timestamps
    end
  end
end
