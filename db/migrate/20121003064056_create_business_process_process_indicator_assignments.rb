class CreateBusinessProcessProcessIndicatorAssignments < ActiveRecord::Migration
  def change
    create_table :business_process_process_indicator_assignments do |t|
      t.integer :business_process_id
      t.integer :process_indicator_id
      t.integer :company_id

      t.timestamps
    end
  end
end
