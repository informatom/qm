class AddCoordinatesToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :x, :integer
    add_column :functions, :y, :integer
  end
end
