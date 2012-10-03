class AddCoordinatesToBusinessProcess < ActiveRecord::Migration
  def change
    add_column :business_processes, :x, :integer
    add_column :business_processes, :y, :integer
  end
end
