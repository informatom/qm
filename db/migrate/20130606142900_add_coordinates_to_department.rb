class AddCoordinatesToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :x, :integer
    add_column :departments, :y, :integer
  end
end
