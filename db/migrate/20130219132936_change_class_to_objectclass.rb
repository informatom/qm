class ChangeClassToObjectclass < ActiveRecord::Migration
  def up
  	rename_column :flow_objects, :class, :flow_object_class
  end

  def down
  end
end
