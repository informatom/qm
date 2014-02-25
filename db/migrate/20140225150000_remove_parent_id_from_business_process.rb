class RemoveParentIdFromBusinessProcess < ActiveRecord::Migration
  def change
    remove_column :business_processes, :parent_id
  end
end
