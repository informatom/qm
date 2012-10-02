class CreateProcessIndicators < ActiveRecord::Migration
  def change
    create_table :process_indicators do |t|
      t.string :name
      t.integer :company_id
      t.string :metering_point
      t.string :value
      t.string :unit
      t.string :nominal_value
      t.string :operator
      t.text :description

      t.timestamps
    end
  end
end
