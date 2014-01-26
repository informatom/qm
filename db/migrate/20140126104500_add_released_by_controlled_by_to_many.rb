class AddReleasedByControlledByToMany < ActiveRecord::Migration
  def change
    add_column :business_processes, :released_by_id, :integer
    add_column :business_processes, :controlled_by_id, :integer

    add_column :functions, :released_by_id, :integer
    add_column :functions, :controlled_by_id, :integer

    add_column :documents, :released_by_id, :integer
    add_column :documents, :controlled_by_id, :integer

    add_column :notes, :released_by_id, :integer
    add_column :notes, :controlled_by_id, :integer
  end
end
