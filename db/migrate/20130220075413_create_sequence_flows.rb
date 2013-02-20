class CreateSequenceFlows < ActiveRecord::Migration
  def change
    create_table :sequence_flows do |t|
      t.string :name
      t.integer :source_id
      t.integer :target_id
      t.integer :flow_object_id

      t.timestamps
    end
  end
end
