class ChangeTypeToFlowObject < ActiveRecord::Migration
  def up
  	rename_column :process_steps, :type_id, :flow_object_id
  end

  def down
  end
end
