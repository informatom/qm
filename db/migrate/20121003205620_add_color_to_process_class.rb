class AddColorToProcessClass < ActiveRecord::Migration
  def change
    add_column :process_classes, :color, :string
  end
end
