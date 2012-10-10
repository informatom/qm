class AddAuthorAndAreaToBusinessProcesses < ActiveRecord::Migration
  def change
    add_column :business_processes, :created_by, :integer
    add_column :business_processes, :updated_by, :integer
    add_column :business_processes, :area, :string
  end
end
